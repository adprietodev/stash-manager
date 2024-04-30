//
//  HomeBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class HomeBuilder {
    func build() -> HomeViewController {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)

        let usersLocalDatasource = UsersLocalDatasource()
        let usersRemoteDatasource = UsersRemoteDatasource()
        let usersRepository = UsersRepository(remoteDatasource: usersRemoteDatasource, localDatasource: usersLocalDatasource)
        let usersUseCase = UsersUseCase(repository: usersRepository)

        let roomsDatasource = RoomsDatasource()
        let roomsRepository = RoomsRepository(datasource: roomsDatasource)
        let roomsUseCase = RoomsUseCase(repository: roomsRepository)

        viewController.viewModel = HomeViewModel(usersUseCase: usersUseCase, roomsUsecase: roomsUseCase)
        return viewController
    }
}
