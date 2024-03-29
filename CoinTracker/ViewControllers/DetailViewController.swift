//
//  DetailViewController.swift, 
//  CoinTracker
//
    

import UIKit

class DetailViewController: UIViewController, ViewModelBased {
    
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var tableView: UITableView!
    
    // MARK: - Public variables
    var viewModel: DetailViewModel! {
        didSet { viewModel.updateData = reload(error:) }
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
        title = viewModel.title
        tableView.register(ListCell.self)
        tableView.tableFooterView = UIView()
        setupLoadingView()
        guard viewModel.isDataReady else {
            startLoader()
            return
        }
    }
    
    private func setupLoadingView() {
        loadingView = .fromNib()
        loadingView?.frame = UIScreen.main.bounds
        guard let loadingView = loadingView else { return }
        view.addSubview(loadingView)
        loadingView.isHidden = true
    }

    private func hideLoadingView() {
        loadingView?.isHidden = true
    }
    
    private func reload(error: Error?) {
        hideLoadingView()
        if let error = error {
            presentAlert(for: error)
            return
        }
        tableView.reloadData()
    }
    
    private func startLoader() {
        loadingView?.isHidden = false
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCurrencies
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListCell = tableView.dequeueReusableCell()
        if let cellViewModel = viewModel.listCellViewModel(at: indexPath.row) {
            cell.setup(with: cellViewModel)
        }
        return cell
    }
}

extension DetailViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
