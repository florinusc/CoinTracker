//
//  PriceListViewModelTests.swift, 
//  CoinTracker
//
    

import XCTest
import DataLayer
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
    
    func test_getData_withError_numberOfPricesIsZero() {
        let viewModel = makeSUT(true)
        viewModel.getData { _ in }
        XCTAssertEqual(viewModel.numberOfPrices, 0)
    }
    
    func test_numberOfPrices_afterGettingData_isCorrect() {
        let viewModel = makeSUT()
        viewModel.getData { _ in }
        XCTAssertEqual(viewModel.numberOfPrices, 8)
    }
    
    func test_priceListCellViewModel_atInvalidIndex_isNil() {
        let viewModel = makeSUT()
        viewModel.getData { _ in }
        XCTAssertNil(viewModel.priceListCellViewModel(at: 10))
    }
    
    func test_priceListCellViewModel_atValidIndex_isNotNil() {
        let viewModel = makeSUT()
        viewModel.getData { _ in }
        XCTAssertNotNil(viewModel.priceListCellViewModel(at: 4))
    }
    
    func test_priceListCellViewModel_atValidIndexWithDataError_isNil() {
        let viewModel = makeSUT(true)
        viewModel.getData { _ in }
        XCTAssertNil(viewModel.priceListCellViewModel(at: 4))
    }
    
    // MARK: - Helpers
    func makeSUT(_ withError: Bool = false) -> PriceListViewModel {
        return PriceListViewModel(repository: MockRepository(withError))
    }
    
}
