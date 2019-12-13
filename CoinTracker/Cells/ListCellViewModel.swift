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
    init(_ price: Price, isToday: Bool = false) {
        mainString = "\(price.value.roundedString) \(price.currency)"
        secondaryString = isToday ? "Today" : price.date
    }
}
