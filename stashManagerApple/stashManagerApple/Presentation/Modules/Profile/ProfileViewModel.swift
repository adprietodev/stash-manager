//
//  ProfileViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ProfileViewModel: ProfileViewModelProtocol {
    let userUseCase: UsersUseCaseProtocol
    var user: User!
    var loadView: (() -> Void)?

    init(userUseCase: UsersUseCaseProtocol) {
        self.userUseCase = userUseCase
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
}
