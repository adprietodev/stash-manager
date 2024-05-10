//
//  HomeDetailBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

class HomeDetailBuilder {
    func build(room: Room, typesRoom: [TypeRoom]) -> HomeDetailViewController {
        let viewController = HomeDetailViewController(nibName: "HomeDetailViewController", bundle: nil)

        let roomsLocalDataSource = RoomsLocalDatasource()
        let roomsRemoteDataSource = RoomsRemoteDatasource()
        let roomsRepository = RoomsRepository(remoteDatasource: roomsRemoteDataSource, localDatasource: roomsLocalDataSource)
        let roomsUseCase = UsersUseCase(repository: roomsRepository)

        let router = HomeDetailRouter(viewController: viewController)
        viewController.viewModel = HomeDetailViewModel(router: router, roomsUseCase: roomsUseCase, room: room, typesRoom: typesRoom)
        return viewController
    }
}
