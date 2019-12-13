//
//  DetailViewController.swift, 
//  CoinTracker
//
    

import UIKit

class DetailViewController: UIViewController, ViewModelBased {
    
    // MARK: - Public variables
    var viewModel: DetailViewModel!
}

extension DetailViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
