//
//  SceneDelegate.swift
//  CoinTracker
//
//  Created by Airtouch New Media SL on 11/12/2019.
//  Copyright © 2019 AppRocket. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let priceListViewController = PriceListViewController.getInstance(with: PriceListViewModel())
        let navigationController = UINavigationController(rootViewController: priceListViewController)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}

