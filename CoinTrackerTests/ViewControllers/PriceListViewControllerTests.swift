//
//  PriceListViewControllerTests.swift, 
//  CoinTracker
//
    

import XCTest
import DataLayer
@testable import CoinTracker

class PriceListViewControllerTests: XCTestCase {
    
    func test_controllerHasTableView_tableViewIsNotNil() {
        XCTAssertNotNil(makeSUT().tableView)
    }
    
    func test_tableViewDataSourceIsController_isTrue() {
        XCTAssertTrue(makeSUT().tableView.dataSource is PriceListViewController)
    }
    
    func test_numberOfCells_isCorrect() {
        let viewController = makeSUT()
        XCTAssertEqual(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0), 8)
    }
    
    func test_viewDidLoad_rendersPriceAndDateInCells_isCorrect() {
        let viewController = makeSUT()
        let fourthCell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 3, section: 0)) as? ListCell

        XCTAssertEqual(fourthCell?.mainLabel.text, "6,119.38 EUR")
        XCTAssertEqual(fourthCell?.secondaryLabel.text, "2019-11-27")
    }
    
    // MARK: - Helpers
    func makeSUT() -> PriceListViewController {
        let viewController = PriceListViewController.getInstance(with: PriceListViewModel(repository: MockRepository()))
        _ = viewController.view
        return viewController
    }
    
}
