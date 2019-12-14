//
//  HistoricalPriceResource.swift, 
//  CoinTracker
//
    

import Foundation
import SwiftyJSON

public struct HistoricalPriceResource {
    public let prices: [String: Double]
    
    public init(json: JSON) {
        prices = json["bpi"].dictionaryObject as? [String: Double] ?? [:]
    }
}
