//
//  DetailViewControllerTests.swift, 
//  CoinTracker
//
    

import XCTest
@testable import CoinTracker

class DetailViewControllerTests: XCTestCase {
    
    func test_controllerHasTableView_tableViewIsNotNil() {
        XCTAssertNotNil(makeSUT().tableView)
    }
    
    func test_tableViewDataSourceIsController_isTrue() {
        XCTAssertTrue(makeSUT().tableView.dataSource is DetailViewController)
    }
    
    func test_tableViewDelegateIsController_isTrue() {
        XCTAssertTrue(makeSUT().tableView.delegate is DetailViewController)
    }
    
    func test_numberOfCells_isCorrect() {
        let viewController = makeSUT()
        XCTAssertEqual(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0), 3)
    }
    
    func test_viewDidLoad_rendersPriceAndCurrencyInCells_isCorrect() {
        let viewController = makeSUT()
        let firstCell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ListCell

        XCTAssertEqual(firstCell?.mainLabel.text, "4,321.12")
        XCTAssertEqual(firstCell?.secondaryLabel.text, "EUR")
    }
    
    // MARK: - Helpers
    func makeSUT() -> DetailViewController {
        let viewController = DetailViewController.getInstance(with: DetailViewModel(currentPrices: [.makeEurMock(), .makeUsdMock(), .makeGbpMock()])!)
        _ = viewController.view
        return viewController
    }
    
}
