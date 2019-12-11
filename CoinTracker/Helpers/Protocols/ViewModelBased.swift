//
//  ViewModelBased.swift
//  CoinTracker
//


import UIKit

protocol ViewModel {}

protocol ViewModelBased: class {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

extension ViewModelBased where Self: Storyboarded & UIViewController {
    static func getInstance(with viewModel: ViewModelType) -> Self {
        let viewController = Self.getInstance()
        viewController.viewModel = viewModel
        return viewController
    }
}
