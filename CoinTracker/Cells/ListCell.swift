//
//  PriceListCell.swift, 
//  CoinTracker
//
    

import UIKit

class ListCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var mainLabel: UILabel!
    @IBOutlet private(set) weak var secondaryLabel: UILabel!
    
    // MARK: - Public functions
    func setup(with viewModel: ListCellViewModel) {
        mainLabel.text = viewModel.mainString
        secondaryLabel.text = viewModel.secondaryString
    }
}
