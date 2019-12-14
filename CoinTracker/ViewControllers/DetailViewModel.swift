//
//  DetailViewModel.swift, 
//  CoinTracker
//
    

import Foundation

class DetailViewModel: ViewModel {
    
    // MARK: - Private constants
    private let date: String
    private let repository: Repository?
    private let supportedCurrencies = ["EUR", "USD", "GBP"]
    
    // MARK: - Public variables
    var numberOfCurrencies: Int { return currentPrices.count }
    var title: String { return date }
    var updateData: (Error?) -> Void = { _ in }
    var isDataReady: Bool { return currentPrices.count > 0 }
    
    // MARK: - Private variables
    private var currentPrices = [Price]()
    
    // MARK: - Lifecycle
    init?(currentPrices: [Price]) {
        guard let date = currentPrices.first?.date else { return nil }
        self.date = date
        self.repository = nil
        self.currentPrices = sort(prices: currentPrices)
    }
    
    init(date: String, repository: Repository) {
        self.date = date
        self.repository = repository
        getData()
    }
    
    // MARK: - Public functions
    func listCellViewModel(at index: Int) -> ListCellViewModel? {
        guard index < numberOfCurrencies, index >= 0 else { return nil }
        return ListCellViewModel(currentPrices[index], withDate: false)
    }
    
    // MARK: - Private functions
    private func getData() {
        repository?.getPrice(on: date, for: supportedCurrencies, { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.updateData(error)
            case .success(let prices):
                self.currentPrices = self.sort(prices: prices)
                self.updateData(nil)
            }
        })
    }
    
    private func sort(prices: [Price]) -> [Price] {
        return prices.sorted(by: { $0.currency < $1.currency })
    }
}
