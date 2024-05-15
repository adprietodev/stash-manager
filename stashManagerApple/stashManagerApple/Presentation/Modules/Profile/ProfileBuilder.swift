//
//  ProfileBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ProfileBuilder {
    func build() -> ProfileViewController {
        let viewController = ProfileViewController(nibName: "ProfileViewController" , bundle: nil)

        let authDatasource = AuthenticationDataSource()
        let authRepository = AuthenticationRepository(datasource: authDatasource)
        let authUseCase = AuthenticationUseCase(repository: authRepository)

        let usersLocalDatasource = UsersLocalDatasource()
        let usersRemoteDatasource = UsersRemoteDatasource()
        let usersRepository = UsersRepository(remoteDatasource: usersRemoteDatasource, localDatasource: usersLocalDatasource)
        let usersUseCase = UsersUseCase(repository: usersRepository)

        let router =  ProfileRouter(viewController: viewController)
        viewController.viewModel = ProfileViewModel(router: router, authUseCase: authUseCase, userUseCase: usersUseCase)
        return viewController
    }
}
