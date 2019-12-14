//
//  TodayViewController.swift, 
//  CoinTracker
//
    

import UIKit
import DataLayer
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var mainLabel: UILabel!
        
    // MARK: - Private constants
    let repository = OnlineRepository()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
    // MARK: - Private functions
    private func setup() {
        mainLabel.text = "Loading price..."
        getData()
    }
    
    private func getData() {
        repository.getCurrentPrices(date: DateHelper.shared.dateString(from: Date())) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error): self.mainLabel.text = error.localizedDescription
            case .success(let prices): self.updateMainLabel(prices: prices)
            }
        }
    }
    
    private func updateMainLabel(prices: [Price]) {
        guard let price = prices.first(where: { $0.currency == "EUR" }) else { return }
        mainLabel.text = "BTC: \(price.value.roundedString) EUR"
    }
    
}
