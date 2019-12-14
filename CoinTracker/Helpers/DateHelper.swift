//
//  DateHelper.swift, 
//  CoinTracker
//
    

import Foundation

class DateHelper {
    
    static let shared = DateHelper()
    
    private let dateFormat = "yyyy-MM-dd"
    
    func dateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
    
    func date(from dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: dateString)
    }
    
}
