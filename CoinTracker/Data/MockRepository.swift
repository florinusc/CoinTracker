//
//  MockRepository.swift, 
//  CoinTracker
//
    

import Foundation

class MockRepository: Repository {
    
    let shouldReturnError: Bool
    
    init(_ shouldReturnError: Bool = false) {
        self.shouldReturnError = shouldReturnError
    }
    
    func getHistoricalPrices(from: Date, to: Date, for currency: String, _ block: @escaping (( Result<[Price], Error>) -> Void)) {
        if shouldReturnError {
            block(Result.failure(CustomError.networkError))
            return
        }
        
        let prices = [Price(currency: "EUR", value: 6509.3508, date: "2019-11-26"),
                      Price(currency: "EUR", value: 6609.1561, date: "2019-11-28"),
                      Price(currency: "EUR", value: 6119.3808, date: "2019-11-27"),
                      Price(currency: "EUR", value: 6509.3508, date: "2019-11-21"),
                      Price(currency: "EUR", value: 6809.6846, date: "2019-11-23"),
                      Price(currency: "EUR", value: 6409.6848, date: "2019-11-24"),
                      Price(currency: "EUR", value: 7002.3651, date: "2019-11-30")]
        block(Result.success(prices))
    }
    
    func getCurrentPrices(_ block: @escaping ((Result<[Price], Error>) -> Void)) {
        if shouldReturnError {
            block(Result.failure(CustomError.networkError))
            return
        }
        let eurPrice = Price(currency: "EUR", value: 6549.3508, date: "2019-11-26")
        let usdPrice = Price(currency: "USD", value: 8417.3508, date: "2019-11-26")
        let gbpPrice = Price(currency: "GBP", value: 5344.3508, date: "2019-11-26")
        block(Result.success([eurPrice, usdPrice, gbpPrice]))
    }
    
    func getPrice(on date: String, for currencies: [String], _ block: @escaping ((Result<[Price], Error>) -> Void)) {
        if shouldReturnError {
            block(Result.failure(CustomError.networkError))
            return
        }
        let eurPrice = Price(currency: "EUR", value: 6549.3508, date: "2019-11-26")
        let usdPrice = Price(currency: "USD", value: 8417.3508, date: "2019-11-26")
        let gbpPrice = Price(currency: "GBP", value: 5344.3508, date: "2019-11-26")
        block(Result.success([eurPrice, usdPrice, gbpPrice]))
    }
}
