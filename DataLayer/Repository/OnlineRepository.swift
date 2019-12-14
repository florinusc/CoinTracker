//
//  OnlineRepository.swift, 
//  CoinTracker
//
    

import Foundation
import NetworkLayer
import SwiftyJSON

public class OnlineRepository: Repository {
    
    public init() {}
    
    public func getHistoricalPrices(from: Date, to: Date, for currency: String, _ block: @escaping ((Result<[Price], Error>) -> Void)) {
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
    
    public func getCurrentPrices(date: String, _ block: @escaping ((Result<[Price], Error>) -> Void)) {
        SessionManager.shared.request(requestType: .currentPrice) { (result) in
            switch result {
            case .failure(let error):
                block(Result.failure(error))
            case .success(let json):
                let resource = CurrentPriceResource(json: json)
                let prices = resource.pairs.map { Price(currency: $0.currency, value: $0.value, date: date) }
                block(Result.success(prices))
            }
        }
    }
    
    public func getPrice(on date: String, for currencies: [String], _ block: @escaping ((Result<[Price], Error>) -> Void)) {
        let dispatchGroup = DispatchGroup()
        var prices = [Price]()
        for currency in currencies {
            dispatchGroup.enter()
            SessionManager.shared.request(requestType: .historicalPrice(currency: currency, startDate: date, endDate: date)) { (result) in
                switch result {
                case .failure(let error):
                    block(Result.failure(error))
                    break
                case .success(let json):
                    let resource = HistoricalPriceResource(json: json)
                    guard let priceResource = resource.prices.first else {
                        block(Result.failure(CustomError.generalError))
                        break
                    }
                    let price = Price(currency: currency, value: priceResource.value, date: priceResource.key)
                    prices.append(price)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            block(Result.success(prices))
        }
    }
}
