//
//  DetailViewModel.swift, 
//  CoinTracker
//
    

import Foundation

class DetailViewModel: ViewModel {
    
    // MARK: - Private constants
    private let date: String
    
    // MARK: - Public variables
    var numberOfCurrencies: Int {
        return currentPrices.count
    }
    
    // MARK: - Private variables
    private var currentPrices = [Price]()
    
    // MARK: - Lifecycle
    init?(currentPrices: [Price]) {
        guard let date = currentPrices.first?.date else { return nil }
        self.currentPrices = currentPrices
        self.date = date
    }
    
    init(date: String) {
        self.date = date
    }
    
    // MARK: - Public functions
    func listCellViewModel(at index: Int) -> ListCellViewModel? {
        guard index < numberOfCurrencies, index >= 0 else { return nil }
        return ListCellViewModel(currentPrices[index])
    }
    
}
