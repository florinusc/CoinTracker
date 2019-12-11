//
//  PriceListViewController.swift, 
//  CoinTracker
//
    

import UIKit

class PriceListViewController: UIViewController, ViewModelBased {
    
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var tableView: UITableView!
    
    // MARK: - Public variables
    var viewModel: PriceListViewModel!
}

extension PriceListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension PriceListViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
