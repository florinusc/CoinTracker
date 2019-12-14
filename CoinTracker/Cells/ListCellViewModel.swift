//
//  PriceListCellViewModel.swift, 
//  CoinTracker
//
    

import Foundation
import DataLayer

struct ListCellViewModel: ViewModel {
    
    // MARK: - Public constants
    let mainString: String
    let secondaryString: String
    
    // MARK: - Lifecycle
    init(_ price: Price, isToday: Bool = false, withDate: Bool = true) {
        mainString = withDate ? "\(price.value.roundedString) \(price.currency)" : price.value.roundedString
        secondaryString = withDate ? (isToday ? "Today" : price.date) : price.currency
    }
}
