//
//  PriceListViewModel.swift, 
//  CoinTracker
//
    

import Foundation

final class PriceListViewModel: ViewModel {
    
    // MARK: - Private constants
    private let repository: Repository!
    private let currentPriceRefreshInterval = 60.0
    private let currentCurrency = "EUR"
    
    // MARK: - Public variables
    var numberOfPrices: Int {
        if currentPrices == nil {
            return historicalPrices.count
        }
        return (historicalPrices.count + 1)
    }
    var updateCurrentPrice: ((Error?) -> Void) = { _ in }
     
    // MARK: - Private variables
    private var historicalPrices = [Price]()
    private var currentPrices: [Price]?
    private var currentPrice: Price? {
        return currentPrices?.first(where: { $0.currency == currentCurrency })
    }
    private var currentPriceTimer: Timer?
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
    }
    
    deinit {
        currentPriceTimer?.invalidate()
    }
    
    // MARK: - Public functions
    func getData(_ block: @escaping (Error?) -> Void) {
        var dataError: Error?
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        repository.getCurrentPrices(date: DateHelper.shared.dateString(from: Date())) { [weak self] (result) in
            switch result {
            case .failure(let error):
                dataError = error
            case .success(let prices):
                self?.currentPrices = prices
                self?.startCurrentPriceTimer()
            }
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        repository.getHistoricalPrices(from: Date().twoWeeksAgo, to: Date().yesterday, for: currentCurrency) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error): dataError = error
            case .success(let prices): self.historicalPrices = self.sortPrices(prices)
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            block(dataError)
        }
    }
    
    func priceListCellViewModel(at index: Int) -> ListCellViewModel? {
        guard index < numberOfPrices, index >= 0 else { return nil }
        if index == 0, let currentPrice = currentPrice {
            return ListCellViewModel(currentPrice, isToday: true)
        }
        let newIndex = currentPrice == nil ? index : index - 1
        return ListCellViewModel(historicalPrices[newIndex])
    }
    
    func detailViewModel(at index: Int) -> DetailViewModel? {
        guard index < numberOfPrices, index >= 0 else { return nil }
        if index == 0, let currentPrices = currentPrices {
            return DetailViewModel(currentPrices: currentPrices)
        }
        let newIndex = currentPrice == nil ? index : index - 1
        return DetailViewModel(date: historicalPrices[newIndex].date, repository: repository)
    }
    
    // MARK: - Private functions
    private func sortPrices(_ prices: [Price]) -> [Price] {
        return prices.sorted { (price0, price1) -> Bool in
            guard let date0 = DateHelper.shared.date(from: price0.date), let date1 = DateHelper.shared.date(from: price1.date) else { return false }
            return date0.compare(date1) == .orderedDescending
        }
    }
    
    private func startCurrentPriceTimer() {
        currentPriceTimer = Timer.scheduledTimer(withTimeInterval: currentPriceRefreshInterval, repeats: true) { [weak self] _ in
            self?.repository.getCurrentPrices(date: DateHelper.shared.dateString(from: Date())) { (result) in
                switch result {
                case .failure(let error): self?.updateCurrentPrice(error)
                case .success: self?.updateCurrentPrice(nil)
                }
            }
        }
    }
}
