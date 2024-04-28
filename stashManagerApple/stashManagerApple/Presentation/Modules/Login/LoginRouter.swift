//
//  LoginRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    // MARK: - Properties
    let viewController: LoginViewController

    init(viewController: LoginViewController) {
        self.viewController = viewController
    }

    // MARK: - Functions
    func goToTabBar() {
        DispatchQueue.main.async {
            let tabBarViewController = TabBarController().build()
            guard let sceneDelegate =  UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
            sceneDelegate.window?.rootViewController = tabBarViewController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}
