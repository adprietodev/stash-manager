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
        // TODO: - build:  viewModel, Datasource, Repository, UseCase
        return viewController
    }
}
