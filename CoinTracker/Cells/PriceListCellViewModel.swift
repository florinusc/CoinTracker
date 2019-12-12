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
        priceString = "\(currentPrice.eur.roundedString) EUR"
        dateString = "Today"
    }
    
    init(_ historicalPrice: HistoricalPrice) {
        priceString = "\(historicalPrice.price.roundedString) EUR"
        dateString = historicalPrice.date
    }
    
}
