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

    func goToSplashLoadData(uuid: UUID) {
        router.goToSplashLoadData(uuid: uuid)
    }

    // MARK: - Functions
    func login(with email: String, at password: String) {
        Task {
            do {
                let login = try await authUseCase.signInWithEmailAndPassword(email, password)
                goToSplashLoadData(uuid: login.user.id)
            } catch {
                loginError?()
            }
        }
    }
}
