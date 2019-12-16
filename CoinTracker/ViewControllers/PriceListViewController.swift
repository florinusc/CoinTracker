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
    
    // MARK: - Private variables
    private var loadingView: LoadingView?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        setupNavBar()
        setupTableView()
        setupLoadingView()
        getData()
    }
    
    private func setupNavBar() {
        title = "Bitcoin price (EUR)"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    private func setupTableView() {
        tableView.register(ListCell.self)
        tableView.tableFooterView = UIView()
    }
    
    private func getData() {
        viewModel.getData { [weak self] (error) in
            self?.hideLoadingView()
            if let error = error {
                self?.presentAlert(for: error)
                return
            }
            self?.tableView.reloadData()
        }
    }
    
    private func setupLoadingView() {
        loadingView = .fromNib()
        loadingView?.frame = UIScreen.main.bounds
        guard let loadingView = loadingView else { return }
        view.addSubview(loadingView)
    }

    private func hideLoadingView() {
        guard let loadingView = loadingView else { return }
        loadingView.isHidden = true
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
        let cell: ListCell = tableView.dequeueReusableCell()
        if let cellViewModel = viewModel.priceListCellViewModel(at: indexPath.row) {
            cell.setup(with: cellViewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let detailViewModel = viewModel.detailViewModel(at: indexPath.row) else { return }
        let detailViewController = DetailViewController.getInstance(with: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension PriceListViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
