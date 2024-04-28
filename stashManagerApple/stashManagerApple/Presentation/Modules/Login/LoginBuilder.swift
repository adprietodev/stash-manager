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
        let authDatasource = AuthenticationDataSource()
        let authRepository = AuthenticationRepository(datasource: authDatasource)
        let authUseCase = AuthenticationUseCase(repository: authRepository)
        viewController.viewModel = LoginViewModel(router: router, useCase: authUseCase)
        return viewController
    }
}
