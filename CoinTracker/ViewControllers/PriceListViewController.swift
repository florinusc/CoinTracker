//
//  PriceListViewController.swift, 
//  CoinTracker
//
    

import UIKit

final class PriceListViewController: UIViewController, ViewModelBased {
    
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var tableView: UITableView!
    
    // MARK: - Public variables
    var viewModel: PriceListViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        title = "Bitcoin price (EUR)"
        tableView.register(PriceListCell.self)
    }
}

extension PriceListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPrices
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PriceListCell = tableView.dequeueReusableCell()
        return cell
    }
}

extension PriceListViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
