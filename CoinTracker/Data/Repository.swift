//
//  Repository.swift, 
//  CoinTracker
//
    

import Foundation

protocol Repository {
    func getHistoricalPrices(from: Date, to: Date, for currency: String, _ block: @escaping (( Result<[Price], Error>) -> Void))
    func getCurrentPrices(date: String, _ block: @escaping ((Result<[Price], Error>) -> Void))
    func getPrice(on date: String, for currencies: [String], _ block: @escaping ((Result<[Price], Error>) -> Void))
}
