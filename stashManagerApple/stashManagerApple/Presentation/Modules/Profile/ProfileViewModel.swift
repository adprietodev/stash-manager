//
//  ProfileViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ProfileViewModel: ProfileViewModelProtocol {
    let userUseCase: UsersUseCaseProtocol
    let router:  ProfileRouterProtocol
    var user: User!
    var loadView: (() -> Void)?

    init(router: ProfileRouterProtocol, userUseCase: UsersUseCaseProtocol) {
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
}
