import Foundation

// MARK: - Constants
struct Constants {
    
    // MARK: - API
    struct API {
        static let coinGeckoURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1"
    }
    
    // MARK: - UserDefaults Keys
    struct UserDefaultsKeys {
        static let watchlist = "Watchlist"
    }
    
    // MARK: - Navigation Titles
    struct NavigationTitles {
        static let topCoins = "Top 20 Coins"
        static let watchlist = "Watchlist"
    }
    
    // MARK: - Tab Labels
    struct TabLabels {
        static let coins = "Coins"
        static let watchlist = "Watchlist"
    }
    
    // MARK: - System Images
    struct SystemImages {
        static let eye = "eye"
        static let star = "eye"
        static let listBullet = "list.bullet"
    }
    
    // MARK: - Messages
    struct Messages {
        static let emptyWatchlist = "No items in your watchlist"
        static let decodingError = "Decoding error: "
        static let networkError = "Network error: "
        static let unknownError = "Unknown error"
        static let apiError = "API Error: "
    }
    
    // MARK: - Currency
    struct Currency {
        static let usdPrefix = "$"
        static let usdLabel = "USD $"
        static let priceFormat = "%.2f"
    }
    
    // MARK: - Timing
    struct Timing {
        static let autoRefreshInterval: TimeInterval = 60
    }

    struct FontSizes {
        static let coinName: CGFloat = 16
    }
}
