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

    init(router: LoginRouterProtocol, useCase: AuthenticationUseCaseProtocol) {
        self.router = router
        self.authUseCase = useCase
    }

    // MARK: - Functions
    func goToTabBar() {
        router.goToTabBar()
    }

    func loginError() {
        print("Error de acceso")
    }

    func login(with email: String, at password: String) {
        Task {
            do {
                let session = try await authUseCase.signInWithEmailAndPassword(email, password)
                print(session.user.id)
                goToTabBar()
            } catch {
                loginError()
            }
        }
    }
}
