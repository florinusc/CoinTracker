//
//  CurrentPriceResource.swift, 
//  CoinTracker
//
    

import Foundation
import SwiftyJSON

public struct CurrentPriceResource {
    public let pairs: [Pair]
    
    public init(json: JSON) {
        var pairs = [Pair]()
        for (key, value) in json["bpi"].dictionaryValue {
            pairs.append(Pair(currency: key, value: value["rate_float"].doubleValue))
        }
        self.pairs = pairs
    }
    
    public struct Pair {
        public let currency: String
        public let value: Double
    }
}
