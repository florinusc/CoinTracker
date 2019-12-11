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
    
    func getHistoricalPrices(_ block: @escaping ((Result<[HistoricalPrice], Error>) -> Void)) {
        if shouldReturnError {
            block(Result.failure(CustomError.networkError))
            return
        }
        let prices = [HistoricalPrice(date: "2019-11-26", price: 6509.3508),
                      HistoricalPrice(date: "2019-11-27", price: 6609.1561),
                      HistoricalPrice(date: "2019-11-28", price: 6119.3808),
                      HistoricalPrice(date: "2019-11-29", price: 7002.3651),
                      HistoricalPrice(date: "2019-11-30", price: 6809.6846),
                      HistoricalPrice(date: "2019-12-01", price: 6409.6848)]
        block(Result.success(prices))
    }
}
