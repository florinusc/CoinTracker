//
//  PriceListViewModel.swift, 
//  CoinTracker
//
    

import Foundation

final class PriceListViewModel: ViewModel {
    
    // MARK: - Private constants
    let repository: Repository!
    
    // MARK: - Public variables
    var numberOfPrices: Int {
        if currentPrice == nil {
            return historicalPrices.count
        }
        return (historicalPrices.count + 1)
    }
    
    // MARK: - Private variables
    private var historicalPrices = [HistoricalPrice]()
    private var currentPrice: CurrentPrice?
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: - Public functions
    func getHistoricalData(_ block: @escaping (Error?) -> Void) {
        repository.getHistoricalPrices { [weak self] (result) in
            switch result {
            case .failure(let error):
                block(error)
            case .success(let prices):
                self?.historicalPrices = prices
                block(nil)
            }
        }
    }
    
    func getCurrentPrice(_ block: @escaping (Error?) -> Void) {
        repository.getCurrentPrice { [weak self] (result) in
            switch result {
            case .failure(let error):
                block(error)
            case .success(let currentPrice):
                self?.currentPrice = currentPrice
                block(nil)
            }
        }
    }
}
