//
//  SplashRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import UIKit

class SplashRouter: SplashRouterProtocol {
    var viewController: SplashViewController

    init(viewController: SplashViewController) {
        self.viewController = viewController
    }

    func goToTabBar() {
        DispatchQueue.main.async { [weak self] in
            guard let self =  self else { return }
            let tabBarViewController = TabBarController().build()
            guard let sceneDelegate =  UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
            sceneDelegate.window?.rootViewController = tabBarViewController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}
