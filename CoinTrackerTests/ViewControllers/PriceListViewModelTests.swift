//
//  PriceListViewModelTests.swift, 
//  CoinTracker
//
    

import XCTest
@testable import CoinTracker

class PriceListViewModelTests: XCTestCase {
    
    func test_numberOfPrices_isZeroInitially_isCorrect() {
        XCTAssertEqual(makeSUT().numberOfPrices, 0)
    }
    
    func test_getData_withoutError_errorIsNil() {
        makeSUT().getData { (error) in
            XCTAssertNil(error)
        }
    }
    
    func test_getData_withError_errorIsNotNil() {
        makeSUT(true).getData { (error) in
            XCTAssertNotNil(error)
        }
    }
    
    // MARK: - Helpers
    func makeSUT(_ withError: Bool = false) -> PriceListViewModel {
        return PriceListViewModel(repository: MockRepository(withError))
    }
    
}
