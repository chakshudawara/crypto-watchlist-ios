import SwiftUI

/// Main screen displaying the top 20 cryptocurrencies and allows watchlist toggling.
struct ContentView: View {
    @ObservedObject var viewModel: CoinViewModel

    var body: some View {
        NavigationView {
            List(viewModel.coins) { coin in
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
                        viewModel.toggleWatchlist(for: coin)
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
            .navigationTitle(Constants.NavigationTitles.topCoins)
            .refreshable {
                viewModel.fetchCoins()
            }
        }
    }
}

/// Preview provider for ContentView
#Preview {
    ContentView(viewModel: CoinViewModel())
}
