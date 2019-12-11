//
//  Storyboarded.swift, 
//  CoinTracker
//
    

import UIKit

protocol Storyboarded {
    static var storyboardName: String { get }
}

extension Storyboarded where Self: UIViewController {
    static func getInstance() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}
