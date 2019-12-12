//
//  UIViewController+Extension.swift, 
//  CoinTracker
//
    

import UIKit

extension UIViewController {
    
    func presentAlert(for error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
