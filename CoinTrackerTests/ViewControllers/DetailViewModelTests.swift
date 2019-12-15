//
//  DetailViewModelTests.swift, 
//  CoinTracker
//
    

import XCTest
import DataLayer
@testable import CoinTracker

class DetailViewModelTests: XCTestCase {
    
    func test_initialNumberOfCurrencies_withExistingPrices_isCorrect() {
        XCTAssertEqual(makeSUT().numberOfCurrencies, 3)
    }
    
    func test_numberOfCurrencies_withoutExistingPrices_isCorrect() {
        XCTAssertEqual(makeSUT(withExistingPrices: false).numberOfCurrencies, 3)
    }
    
    func test_titleIsDate_withExistingPrices_isCorrect() {
        XCTAssertEqual(makeSUT().title, "2019-12-01")
    }
    
    func test_titleIsDate_withoutExistingPrices_isCorrect() {
        XCTAssertEqual(makeSUT(withExistingPrices: false).title, "2019-11-30")
    }
    
    func test_listCellViewModelatValidIndex_isNotNil() {
        XCTAssertNotNil(makeSUT().listCellViewModel(at: 1))
    }
    
    func test_listCellViewModelatInvalidIndex_isNil() {
        XCTAssertNil(makeSUT().listCellViewModel(at: 5))
    }
    
    // MARK: - Helpers
    func makeSUT(withExistingPrices: Bool = true) -> DetailViewModel {
        if withExistingPrices {
            return DetailViewModel(currentPrices: [.makeEurMock(), .makeUsdMock(), .makeGbpMock()])!
        }
        return DetailViewModel(date: "2019-11-30", repository: MockRepository())
    }
    
}
