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
        makeSUT().getHistoricalData { (error) in
            XCTAssertNil(error)
        }
    }
    
    func test_getData_withError_errorIsNotNil() {
        makeSUT(true).getHistoricalData { (error) in
            XCTAssertNotNil(error)
        }
    }
    
    func test_getData_withoutError_numberOfPricesIsCorrect() {
        let viewModel = makeSUT()
        viewModel.getHistoricalData { _ in }
        XCTAssertEqual(viewModel.numberOfPrices, 6)
    }
    
    func test_getData_withError_numberOfPricesIsZero() {
        let viewModel = makeSUT(true)
        viewModel.getHistoricalData { _ in }
        XCTAssertEqual(viewModel.numberOfPrices, 0)
    }
    
    func test_getCurrentPrice_withoutError_errorIsNil() {
        let viewModel = makeSUT()
        viewModel.getCurrentPrice { (error) in
            XCTAssertNil(error)
        }
    }
    
    func test_getCurrentPrice_withError_errorIsNotNil() {
        let viewModel = makeSUT(true)
        viewModel.getCurrentPrice { (error) in
            XCTAssertNotNil(error)
        }
    }
    
    func test_numberOfPrices_withHistoricalPricesAndCurrentPrice_isCorrect() {
        let viewModel = makeSUT()
        viewModel.getHistoricalData { _ in }
        viewModel.getCurrentPrice { _ in }
        XCTAssertEqual(viewModel.numberOfPrices, 7)
    }
    
    // MARK: - Helpers
    func makeSUT(_ withError: Bool = false) -> PriceListViewModel {
        return PriceListViewModel(repository: MockRepository(withError))
    }
    
}
