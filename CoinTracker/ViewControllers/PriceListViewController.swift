//
//  PriceListViewController.swift, 
//  CoinTracker
//
    

import UIKit

final class PriceListViewController: UIViewController, ViewModelBased {
    
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var tableView: UITableView!
    
    // MARK: - Public variables
    var viewModel: PriceListViewModel! {
        didSet { viewModel.updateCurrentPrice = updateCurrentPrice(error:) }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        title = "Bitcoin price (EUR)"
        tableView.register(PriceListCell.self)
        viewModel.getData { [weak self] (error) in
            if let error = error {
                self?.presentAlert(for: error)
                return
            }
            self?.tableView.reloadData()
        }
    }
    
    private func updateCurrentPrice(error: Error?) {
        if let error = error {
            presentAlert(for: error)
            return
        }
        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}

extension PriceListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPrices
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PriceListCell = tableView.dequeueReusableCell()
        if let cellViewModel = viewModel.priceListCellViewModel(at: indexPath.row) {
            cell.setup(with: cellViewModel)
        }
        return cell
    }
}

extension PriceListViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
