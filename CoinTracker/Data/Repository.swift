//
//  Repository.swift, 
//  CoinTracker
//
    

import Foundation

protocol Repository {
    func getHistoricalPrices(_ block: @escaping (( Result<[HistoricalPrice], Error>) -> Void))
    func getCurrentPrice(_ block: @escaping ((Result<CurrentPrice, Error>) -> Void))
}
