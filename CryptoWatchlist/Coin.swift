struct Coin: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let symbol: String
    let current_price: Double
}

struct APIResponse: Codable {
    let coins: [Coin]?
    let data: [Coin]?
    let results: [Coin]?
}
