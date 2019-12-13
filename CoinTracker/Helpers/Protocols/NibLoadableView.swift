//
//  NibLoadableView.swift, 
//  CoinTracker
//
    

import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
    static func fromNib() -> Self? {
        let bundle = Bundle(for: self)
        let nib = bundle.loadNibNamed(nibName, owner: self, options: nil)
        return nib?.first as? Self
    }
}
