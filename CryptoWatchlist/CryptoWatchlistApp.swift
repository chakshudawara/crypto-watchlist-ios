import SwiftUI

@main
struct CryptoWatchlistApp: App {
    @StateObject private var viewModel = CoinViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView(viewModel: self.viewModel)
                    .tabItem {
                        Label(Constants.TabLabels.coins, systemImage: Constants.SystemImages.listBullet)
                    }
                WatchlistView(viewModel: self.viewModel)
                    .tabItem {
                        Label(Constants.TabLabels.watchlist, systemImage: Constants.SystemImages.eye)
                    }
            }
        }
    }
}
