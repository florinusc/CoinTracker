//
//  Date+Extension.swift, 
//  CoinTracker
//
    

import Foundation

extension Date {
    
    var yesterday: Date { day(with: -1) }
    var twoWeeksAgo: Date { day(with: -14) }
    
    private func day(with difference: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: difference, to: Date()) ?? Date()
    }
}
