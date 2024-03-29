//
//  SceneDelegate.swift
//  CoinTracker
//


import UIKit
import DataLayer

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let priceListViewController = PriceListViewController.getInstance(with: PriceListViewModel(repository: OnlineRepository()))
        let navigationController = UINavigationController(rootViewController: priceListViewController)
        navigationController.navigationBar.tintColor = .label
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}

