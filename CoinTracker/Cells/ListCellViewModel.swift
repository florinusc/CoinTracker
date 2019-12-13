//
//  PriceListCellViewModel.swift, 
//  CoinTracker
//
    

import Foundation


struct ListCellViewModel: ViewModel {
    
    // MARK: - Public constants
    let mainString: String
    let secondaryString: String
    
    // MARK: - Lifecycle
    init(_ currentPrice: CurrentPrice) {
        mainString = "\(currentPrice.eur.roundedString) EUR"
        secondaryString = "Today"
    }
    
    init(_ historicalPrice: HistoricalPrice) {
        mainString = "\(historicalPrice.price.roundedString) EUR"
        secondaryString = historicalPrice.date
    }
    
}
