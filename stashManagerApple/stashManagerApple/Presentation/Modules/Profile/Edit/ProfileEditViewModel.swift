//
//  ProfileEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 9/5/24.
//

import Foundation

class ProfileEditViewModel: ProfileEditViewModelProtocol {
    var user: User
    var userUseCase: UsersUseCaseProtocol
    var router: ProfileEditRouterProtocol
    var imageBase64: String

    init(router: ProfileEditRouterProtocol,user: User, userUseCase: UsersUseCaseProtocol) {
        self.router = router
        self.user = user
        self.userUseCase = userUseCase
        self.imageBase64 = user.base64image
    }

    func editUser(nameUser: String, lastName: String) {
        user.base64image = imageBase64
        user.name = nameUser
        user.lastname = lastName
        Task {
            do {
                try userUseCase.setCurrentUser(user)
                try await userUseCase.updateUser(user)
                finishEditUser()
            } catch {
                
            }
        }
    }

    func finishEditUser() {
        router.finishEditUser()
    }
}
