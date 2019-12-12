//
//  Decimal+Extension.swift, 
//  CoinTracker
//
    

import Foundation

extension Decimal {
    var roundedString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.roundingMode = .halfEven
        return formatter.string(from: NSDecimalNumber(decimal: self)) ?? "PRICE ERROR"
    }
}
