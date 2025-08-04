Crypto Watchlist iOS App
A simple iOS app built with SwiftUI that displays the top 20 cryptocurrencies and allows users to maintain a personal watchlist.

Features
📱 Clean, native iOS interface built with SwiftUI
📊 Real-time cryptocurrency data from CoinGecko API
⭐ Personal watchlist functionality
🔄 Auto-refresh every 60 seconds
💾 Persistent watchlist storage using UserDefaults
🎨 Tab-based navigation between coins list and watchlist
Platform
Swift/SwiftUI - Native iOS Application

Minimum iOS Version: iOS 14.0+
Xcode Version: 12.0+
Language: Swift 5.0+
Setup Instructions
Prerequisites
Xcode 12.0 or later
iOS Simulator or physical iOS device
Internet connection for API calls
Installation Steps
Clone the repository
bash
git clone https://github.com/yourusername/crypto-watchlist-ios.git
cd crypto-watchlist-ios
Open in Xcode
bash
open CryptoWatchlist.xcodeproj
Or open Xcode and select "Open a project or file" → Navigate to the cloned folder → Select CryptoWatchlist.xcodeproj
Select Target Device
Choose your preferred simulator (iPhone 14, iPhone 15, etc.) or connect a physical device
Ensure iOS deployment target is set to 14.0 or later
Build and Run
Press Cmd + R or click the "Play" button in Xcode
The app will build and launch on your selected device/simulator
Project Structure
CryptoWatchlist/
├── CryptoWatchlistApp.swift     # Main app entry point
├── Models/
│   └── Coin.swift               # Coin data model
├── ViewModels/
│   └── CoinViewModel.swift      # Business logic and API calls
├── Views/
│   ├── ContentView.swift        # Main coins list view
│   └── WatchlistView.swift      # Watchlist view
├── Utils/
│   └── Constants.swift          # App constants and strings
└── README.md
API Information
This app uses the CoinGecko Free API to fetch cryptocurrency data:

Endpoint: https://api.coingecko.com/api/v3/coins/markets
Rate Limit: No API key required for basic usage
Data: Top 20 cryptocurrencies by market cap
Update Frequency: Every 60 seconds
Key Components
Models
Coin: Represents a cryptocurrency with id, name, symbol, and current price
ViewModels
CoinViewModel: Handles API calls, watchlist management, and data persistence
Views
ContentView: Displays the top 20 cryptocurrencies with watchlist toggle
WatchlistView: Shows user's saved cryptocurrencies
CryptoWatchlistApp: Main app with tab navigation
Assumptions and Shortcuts
Due to development time constraints, the following assumptions and shortcuts were made:

API & Data
No API Key: Using CoinGecko's free tier without authentication
Limited Data: Only fetching basic coin info (name, symbol, price)
No Error Recovery: Basic error handling without retry mechanisms
Hard-coded URL: API endpoint is not configurable
UI/UX
Simple Design: Minimal styling focused on functionality
No Search: No search/filter functionality for the coins list
No Price History: Only current prices, no charts or historical data
No Sorting: Fixed sorting by market cap only
Data Persistence
UserDefaults Only: Using UserDefaults instead of Core Data or other databases
No Cloud Sync: Watchlist is stored locally only
No Data Migration: No handling of data structure changes
Performance
No Pagination: Loading all top 20 coins at once
No Image Caching: No coin logos or image optimization
Basic Memory Management: Minimal optimization for memory usage
Testing
No Unit Tests: No automated testing implemented
No Error Scenarios: Limited testing of edge cases and error conditions
Future Enhancements
Potential improvements for a production-ready app:

🔐 Secure API key management
📈 Price charts and historical data
🔍 Search and filter functionality
🌙 Dark mode support
💱 Multiple currency support
☁️ iCloud sync for watchlist
🧪 Comprehensive unit and UI tests
📊 Portfolio tracking with quantities
🔔 Price alerts and notifications
🎨 Enhanced UI with animations
Contributing
Fork the repository
Create a feature branch (git checkout -b feature/amazing-feature)
Commit your changes (git commit -m 'Add some amazing feature')
Push to the branch (git push origin feature/amazing-feature)
Open a Pull Request
License
This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgments
CoinGecko API for providing free cryptocurrency data
Apple's SwiftUI framework for the user interface
SF Symbols for the iconography
