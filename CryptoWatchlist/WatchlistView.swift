import SwiftUI

/// Displays the list of user's watchlisted cryptocurrencies.
struct WatchlistView: View {
    @ObservedObject var viewModel: CoinViewModel

    var body: some View {
        NavigationView {
            Group {
                if viewModel.watchlistedCoins().isEmpty {
                    // Empty State UI
                    VStack(spacing: 12) {
                        Image(systemName: Constants.SystemImages.eye)
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text(Constants.Messages.emptyWatchlist)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding()
                } else {
                    // Watchlist Content
                    List(viewModel.watchlistedCoins()) { coin in
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(coin.name)
                                    .font(.system(size: Constants.FontSizes.coinName, weight: .semibold))
                                Text(coin.symbol.uppercased())
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("\(Constants.Currency.usdPrefix)\(coin.current_price, specifier: Constants.Currency.priceFormat)")
                                .font(.subheadline)
                                .foregroundColor(.green)
                            Button(action: {
                                withAnimation {
                                    viewModel.toggleWatchlist(for: coin)
                                }
                            }) {
                                Image(systemName: Constants.SystemImages.star)
                                    .foregroundColor(viewModel.isWatchlisted(coin) ? .blue : .gray)
                                    .padding(.leading, 8)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        .padding(.vertical, 4)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle(Constants.NavigationTitles.topCoins)
        }
    }
}
