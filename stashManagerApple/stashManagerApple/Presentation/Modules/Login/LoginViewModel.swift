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
    let authUseCase: AuthenticationUseCaseProtocol
    var loginError: (() -> Void)?

    init(router: LoginRouterProtocol, useCase: AuthenticationUseCaseProtocol) {
        self.router = router
        self.authUseCase = useCase
    }

    // MARK: - Functions
    func goToTabBar() {
        router.goToTabBar()
    }

    func login(with email: String, at password: String) {
        Task {
            do {
                _ = try await authUseCase.signInWithEmailAndPassword(email, password)
                goToTabBar()
            } catch {
                loginError?()
            }
        }
    }
}
