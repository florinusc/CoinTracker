//
//  DateHelper.swift, 
//  CoinTracker
//
    

import Foundation

public class DateHelper {
    
    public static let shared = DateHelper()
    
    private let dateFormat = "yyyy-MM-dd"
    
    public func dateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
    
    public func date(from dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: dateString)
    }
    
}
