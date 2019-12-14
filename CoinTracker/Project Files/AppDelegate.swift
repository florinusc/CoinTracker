//
//  AppDelegate.swift
//  CoinTracker
//


import UIKit
import DataLayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard #available(iOS 13.0, *) else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            let priceListViewController = PriceListViewController.getInstance(with: PriceListViewModel(repository: OnlineRepository()))
            let navigationController = UINavigationController(rootViewController: priceListViewController)
            navigationController.navigationBar.tintColor = .black
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            return true
        }
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

