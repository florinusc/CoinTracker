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
    func getData(_ block: @escaping (Error?) -> Void) {
        var dataError: Error?
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        getCurrentPrice { (error) in
            dataError = error
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        getHistoricalData { (error) in
            dataError = error
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            block(dataError)
        }
    }
    
    func priceListCellViewModel(at index: Int) -> PriceListCellViewModel? {
        guard index < numberOfPrices, index >= 0 else { return nil }
        if index == 0, let currentPrice = currentPrice {
            return PriceListCellViewModel(currentPrice)
        }
        let newIndex = currentPrice == nil ? index : index - 1
        return PriceListCellViewModel(historicalPrices[newIndex])
    }
    
    // MARK: - Private functions
    private func getHistoricalData(_ block: @escaping (Error?) -> Void) {
        repository.getHistoricalPrices { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                block(error)
            case .success(let prices):
                self.historicalPrices = self.sortPrices(prices)
                block(nil)
            }
        }
    }
    
    private func getCurrentPrice(_ block: @escaping (Error?) -> Void) {
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
    
    private func sortPrices(_ prices: [HistoricalPrice]) -> [HistoricalPrice] {
        return prices.sorted { (price0, price1) -> Bool in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            guard let date0 = dateFormatter.date(from: price0.date), let date1 = dateFormatter.date(from: price1.date) else { return false }
            return date0.compare(date1) == .orderedDescending
        }
    }
}
