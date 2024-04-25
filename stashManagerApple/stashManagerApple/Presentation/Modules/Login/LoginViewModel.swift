//
//  LoginViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    // MARK: - Properties
    let router: LoginRouterProtocol

    init(router: LoginRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions
    func goToTabBar() {
        router.goToTabBar()
    }
}
