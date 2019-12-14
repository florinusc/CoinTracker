//
//  OnlineRepository.swift, 
//  CoinTracker
//
    

import Foundation
import NetworkLayer
import SwiftyJSON

class OnlineRepository: Repository {
    func getHistoricalPrices(from: Date, to: Date, for currency: String, _ block: @escaping ((Result<[Price], Error>) -> Void)) {
        let startDate = DateHelper.shared.dateString(from: from)
        let endDate = DateHelper.shared.dateString(from: to)
        SessionManager.shared.request(requestType: .historicalPrice(currency: currency, startDate: startDate, endDate: endDate)) { (result) in
            switch result {
            case .failure(let error):
                block(Result.failure(error))
            case .success(let json):
                let resource = HistoricalPriceResource(json: json)
                let prices = resource.prices.map { (arg) -> Price in
                    let (date, price) = arg
                    return Price(currency: currency, value: price, date: date)
                }
                block(Result.success(prices))
            }
        }
    }
    
    func getCurrentPrices(_ block: @escaping ((Result<[Price], Error>) -> Void)) {
        
    }
    
    func getPrice(on date: String, for currencies: [String], _ block: @escaping ((Result<[Price], Error>) -> Void)) {
        
    }
}
