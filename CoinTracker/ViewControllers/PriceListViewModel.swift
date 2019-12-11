//
//  PriceListViewModel.swift, 
//  CoinTracker
//
    

import Foundation

class PriceListViewModel: ViewModel {
    
    // MARK: - Public variables
    var numberOfPrices: Int {
        return historicalPrices.count
    }
    
    // MARK: - Private variables
    private var historicalPrices = [HistoricalPrice]()
    
}
