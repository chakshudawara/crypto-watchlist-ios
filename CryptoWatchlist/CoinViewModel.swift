import SwiftUI

/// ViewModel to manage coin data, fetch from API, and maintain user watchlist.
class CoinViewModel: ObservableObject {
    @Published var coins: [Coin] = []                     // All fetched coins
    @Published var watchlist: Set<String> = []            // Watchlist coin IDs
    @Published var isLoading = false                      // Loading state
    @Published var errorMessage: String?                  // Error message to show in UI

    private let url = Constants.API.coinGeckoURL
    private var timer: Timer?

    /// Initializes the ViewModel, loads persisted watchlist and begins auto-refresh.
    init() {
        loadWatchlist()
        fetchCoins()
        startAutoRefresh()
    }

    /// Fetches top 20 coins from the CoinGecko API.
    func fetchCoins() {
        guard let endpoint = URL(string: url) else { return }

        isLoading = true
        errorMessage = nil

        URLSession.shared.dataTask(with: endpoint) { data, response, error in
            DispatchQueue.main.async { self.isLoading = false }

            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.errorMessage = "\(Constants.Messages.networkError)\(error?.localizedDescription ?? Constants.Messages.unknownError)"
                }
                return
            }

            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON response:\n\(jsonString)")
            }

            do {
                let decoded = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = decoded
                    self.errorMessage = nil
                }
            } catch {
                if let fallbackJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let message = fallbackJson["error"] as? String {
                    DispatchQueue.main.async {
                        self.errorMessage = "\(Constants.Messages.apiError)\(message)"
                        print("API returned error message: \(message)")
                    }
                } else {
                    DispatchQueue.main.async {
                        self.errorMessage = "\(Constants.Messages.decodingError)\(error.localizedDescription)"
                        print("Decoding failed with error: \(error)")
                    }
                }
            }
        }.resume()
    }

    /// Converts an array of dictionary coins to [Coin]
    private func parseCoinsFromDictArray(_ dictArray: [[String: Any]]) throws -> [Coin] {
        let jsonData = try JSONSerialization.data(withJSONObject: dictArray)
        return try JSONDecoder().decode([Coin].self, from: jsonData)
    }

    /// Adds or removes a coin from the watchlist.
    func toggleWatchlist(for coin: Coin) {
        if watchlist.contains(coin.id) {
            watchlist.remove(coin.id)
        } else {
            watchlist.insert(coin.id)
        }
        saveWatchlist()
    }

    /// Checks if a coin is in the watchlist.
    func isWatchlisted(_ coin: Coin) -> Bool {
        watchlist.contains(coin.id)
    }

    /// Filters and returns only the watchlisted coins.
    func watchlistedCoins() -> [Coin] {
        coins.filter { watchlist.contains($0.id) }
    }

    /// Saves the watchlist to UserDefaults.
    private func saveWatchlist() {
        UserDefaults.standard.set(Array(watchlist), forKey: Constants.UserDefaultsKeys.watchlist)
    }

    /// Loads the watchlist from UserDefaults.
    private func loadWatchlist() {
        if let saved = UserDefaults.standard.stringArray(forKey: Constants.UserDefaultsKeys.watchlist) {
            watchlist = Set(saved)
        }
    }

    /// Starts automatic coin list refreshing every 60 seconds.
    private func startAutoRefresh() {
        timer = Timer.scheduledTimer(withTimeInterval: Constants.Timing.autoRefreshInterval, repeats: true) { _ in
            self.fetchCoins()
        }
    }

    /// Cancels the timer on deallocation.
    deinit {
        timer?.invalidate()
    }
}
