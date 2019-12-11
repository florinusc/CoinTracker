//
//  PriceListViewModelTests.swift, 
//  CoinTracker
//
    

import XCTest
@testable import CoinTracker

class PriceListViewModelTests: XCTestCase {
    
    func test_numberOfPrices_isZeroInitially_isCorrect() {
        let viewModel = PriceListViewModel()
        
        XCTAssertEqual(viewModel.numberOfPrices, 0)
    }
    
}
