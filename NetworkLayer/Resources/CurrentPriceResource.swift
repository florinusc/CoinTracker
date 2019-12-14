//
//  CurrentPriceResource.swift, 
//  CoinTracker
//
    

import Foundation
import SwiftyJSON

public struct CurrentPriceResource {
    let eurPrice: Float
    let usdPrice: Float
    let gbpPrice: Float
    
    public init(json: JSON) {
        eurPrice = json["bpi"]["EUR"]["rate_float"].floatValue
        usdPrice = json["bpi"]["USD"]["rate_float"].floatValue
        gbpPrice = json["bpi"]["GBP"]["rate_float"].floatValue
    }
}
