//
//  Price+Extensions.swift, 
//  CoinTracker
//
    

import Foundation
@testable import DataLayer

extension Price {
    static func makeEurMock() -> Price {
        return Price(currency: "EUR", value: 4321.1231, date: "2019-12-01")
    }
    
    static func makeUsdMock() -> Price {
        return Price(currency: "USD", value: 5321.1231, date: "2019-12-01")
    }
    
    static func makeGbpMock() -> Price {
        return Price(currency: "GBP", value: 3321.1231, date: "2019-12-01")
    }
}
