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
        return historicalPrices.count
    }
    
    // MARK: - Private variables
    private var historicalPrices = [HistoricalPrice]()
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: - Public functions
    func getData(_ block: @escaping (Error?) -> Void) {
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
}
