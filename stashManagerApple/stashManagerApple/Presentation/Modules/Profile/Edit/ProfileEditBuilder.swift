//
//  ProfileEditBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 9/5/24.
//

import Foundation

class ProfileEditBuilder {
    func build(_ user: User) -> ProfileEditViewController {
        let viewController = ProfileEditViewController(nibName: "ProfileEditViewController", bundle: nil)
        let userRemoteDatasource = UsersRemoteDatasource()
        let userLocalDatasource = UsersLocalDatasource()
        let userRepository = UsersRepository(remoteDatasource: userRemoteDatasource, localDatasource: userLocalDatasource)
        let userUseCase = UsersUseCase(repository: userRepository)

        let router = ProfileEditRouter(viewController: viewController)
        viewController.viewModel = ProfileEditViewModel(router: router, user: user, userUseCase: userUseCase )
        return viewController
    }
}
