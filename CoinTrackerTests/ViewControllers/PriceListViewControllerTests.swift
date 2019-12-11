//
//  PriceListViewControllerTests.swift, 
//  CoinTracker
//
    

import XCTest
@testable import CoinTracker

class PriceListViewControllerTests: XCTestCase {
    
    func test_numberOfCells_isZeroInitially_isCorrect() {
        XCTAssertEqual(makeSUT().tableView.numberOfRows(inSection: 0), 0)
    }
    
    // MARK: - Helpers
    func makeSUT() -> PriceListViewController {
        let viewController = PriceListViewController.getInstance(with: PriceListViewModel())
        _ = viewController.view
        return viewController
    }
    
}
