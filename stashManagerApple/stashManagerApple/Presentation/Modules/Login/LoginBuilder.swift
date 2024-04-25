//
//  LoginBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class LoginBuilder {
    func build() -> LoginViewController {
        let viewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let router = LoginRouter(viewController: viewController)
        viewController.viewModel = LoginViewModel(router: router)
        return viewController
    }
}
