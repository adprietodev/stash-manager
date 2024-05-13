//
//  HomeEditBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 7/5/24.
//

import Foundation

class HomeEditBuilder {
    func build(room: Room, typesRoom: [TypeRoom], typeScreen: TypeAction) -> HomeEditViewController {
        let viewController = HomeEditViewController(nibName: "HomeEditViewController", bundle: nil)

        let remoteRoomsDatasource = RoomsRemoteDatasource()
        let localRoomsDatasource = RoomsLocalDatasource()
        let roomsRepository = RoomsRepository(remoteDatasource: remoteRoomsDatasource, localDatasource: localRoomsDatasource)
        let roomUseCase = RoomsUseCase(repository: roomsRepository)

        let router = HomeEditRouter(viewController: viewController)
        switch typeScreen {
        case .edit:
            viewController.viewModel = HomeEditViewModel(router: router, roomUseCase: roomUseCase, room: room, typesRoom: typesRoom, typeScreen: typeScreen)
        case .add:
            viewController.viewModel = HomeEditViewModel(router: router, typesRoom: typesRoom, typeScreen: typeScreen)
        }

        return viewController
    }
}
