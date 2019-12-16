# Coin Tracker

Coin Tracker in an app that displays the price of Bitcoin for the last two weeks.

Coin Widget is a Today widget that displays the price of Bitcoin in EUR and updates it every ten seconds.

## Run the App

Install  [CocoaPods](https://guides.cocoapods.org/using/getting-started.html#installation).

Run the following command to install Cocoapods dependencies:

```bash
pod install
```

Open `CoinTracker.xcworkspace`

## Frameworks

The frameworks that were used in the project are:

- [Moya](https://github.com/Moya/Moya) is a networking library. It uses Alamofire, but provides a different approach to structuring the network layer. It encapsulates the requests in a type safe way, using enumerations. This helps with streamlining the process of adding new requests and minimizes the chances of making mistakes.
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) is a JSON parsing library. The main advantage that it has over `Codable` is that it helps with reducing the amount of code that you have to write in order to parse a response. It's especially useful for requests where you receive more information than you need. You can just extract exactly what you require.