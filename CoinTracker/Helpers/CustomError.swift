//
//  CustomError.swift, 
//  CoinTracker
//
    

import Foundation

enum CustomError: Error {
    case generalError
    case networkError
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .generalError: return NSLocalizedString("Something went wrong", comment: "General Error")
        case .networkError: return NSLocalizedString("There was a problem with the network", comment: "Network Error")
        }
    }
}
