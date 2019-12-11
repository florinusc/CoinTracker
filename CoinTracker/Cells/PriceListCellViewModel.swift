//
//  PriceListCellViewModel.swift, 
//  CoinTracker
//
    

import Foundation


struct PriceListCellViewModel: ViewModel {
    
    // MARK: - Public constants
    let priceString: String
    let dateString: String
    
    // MARK: - Lifecycle
    init(_ currentPrice: CurrentPrice) {
        priceString = "\(currentPrice.eur)"
        dateString = "Today"
    }
    
    init(_ historicalPrice: HistoricalPrice) {
        priceString = "\(historicalPrice.price)"
        dateString = historicalPrice.date
    }
    
}
