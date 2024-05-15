//
//  ProfileViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ProfileViewModel: ProfileViewModelProtocol {
    let userUseCase: UsersUseCaseProtocol
    let authUseCase: AuthenticationUseCaseProtocol
    let router:  ProfileRouterProtocol
    var user: User!
    var loadView: (() -> Void)?

    init(router: ProfileRouterProtocol,authUseCase: AuthenticationUseCaseProtocol, userUseCase: UsersUseCaseProtocol) {
        self.authUseCase = authUseCase
        self.userUseCase = userUseCase
        self.router = router
    }

    func loadUserData() {
        Task {
            do {
                user = try userUseCase.getCurrentUser()
                loadView?()
            } catch {
            }
        }
    }

    func goToEditProfile() {
        router.goToEditProfile(user: user)
    }

    func goToLogout() {
        Task {
            do {
                try await authUseCase.signOutCurrentUser()
                router.goToLogout()
            } catch {
                
            }
        }
        
    }
}
