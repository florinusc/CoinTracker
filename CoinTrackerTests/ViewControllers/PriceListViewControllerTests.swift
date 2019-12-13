//
//  PriceListViewControllerTests.swift, 
//  CoinTracker
//
    

import XCTest
@testable import CoinTracker

class PriceListViewControllerTests: XCTestCase {
    
    func test_controllerHasTableView_tableViewIsNotNil() {
        XCTAssertNotNil(makeSUT().tableView)
    }
    
    func test_tableViewDataSourceIsController_isTrue() {
        XCTAssertTrue(makeSUT().tableView.dataSource is PriceListViewController)
    }
    
    func test_numberOfCells_isCorrect() {
        XCTAssertEqual(makeSUT().tableView.numberOfRows(inSection: 0), 7)
    }
    
    func test_viewDidLoad_rendersPriceAndDateInCells_isCorrect() {
        let viewController = makeSUT()
        let fourthCell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 3, section: 0)) as? PriceListCell

        XCTAssertEqual(fourthCell?.priceLabel.text, "7,002.37 EUR")
        XCTAssertEqual(fourthCell?.dateLabel.text, "2019-11-29")
    }
    
    // MARK: - Helpers
    func makeSUT() -> PriceListViewController {
        let viewController = PriceListViewController.getInstance(with: PriceListViewModel(repository: MockRepository()))
        _ = viewController.view
        return viewController
    }
    
}
