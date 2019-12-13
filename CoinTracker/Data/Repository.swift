//
//  Repository.swift, 
//  CoinTracker
//
    

import Foundation

protocol Repository {
    func getHistoricalPrices(from: Date, to: Date, _ block: @escaping (( Result<[HistoricalPrice], Error>) -> Void))
    func getCurrentPrice(_ block: @escaping ((Result<CurrentPrice, Error>) -> Void))
}
