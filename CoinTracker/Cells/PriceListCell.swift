//
//  PriceListCell.swift, 
//  CoinTracker
//
    

import UIKit

class PriceListCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var priceLabel: UILabel!
    @IBOutlet private(set) weak var dateLabel: UILabel!
    
    // MARK: - Public functions
    func setup(with viewModel: PriceListCellViewModel) {
        priceLabel.text = viewModel.priceString
        dateLabel.text = viewModel.dateString
    }
}
