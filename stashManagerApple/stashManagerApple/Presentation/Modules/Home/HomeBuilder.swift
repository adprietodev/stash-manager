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

        let roomsRemoteDatasource = RoomsRemoteDatasource()
        let roomsLocalDatasource = RoomsLocalDatasource()
        let roomsRepository = RoomsRepository(remoteDatasource: roomsRemoteDatasource, localDatasource: roomsLocalDatasource)
        let roomsUseCase = RoomsUseCase(repository: roomsRepository)

        let linksRemoteDatasource = LinkRemoteDatasource()
        let linksLocalDatasource = LinksLocalDatasource()
        let linksRepository = LinksRepository(remoteDatasource: linksRemoteDatasource, localDatasource: linksLocalDatasource)
        let linksUseCase = LinkUseCase(repository: linksRepository)

        viewController.viewModel = HomeViewModel(usersUseCase: usersUseCase, roomsUseCase: roomsUseCase, linksUseCase: linksUseCase)
        return viewController
    }
}
