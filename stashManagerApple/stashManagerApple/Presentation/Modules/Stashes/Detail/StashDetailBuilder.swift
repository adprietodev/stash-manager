//
//  StashDetailBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashDetailBuilder {
    func build(room: Room, stash: Stash, typesStash: [TypeStash]) -> StashDetailViewController {
        let viewController = StashDetailViewController(nibName: "StashDetailViewController", bundle: nil)

        let stashesRemoteDatasource = StashesRemoteDatasource()
        let stashesLocalDatasource = StashesLocalDatasource()
        let stashesRepository = StashesRepository(remoteDatasource: stashesRemoteDatasource, localDatasource: stashesLocalDatasource)
        let stashesUseCase = StashesUseCase(repository: stashesRepository)

        let roomsRemoteDatasource = RoomsRemoteDatasource()
        let roomsLocalDatasource = RoomsLocalDatasource()
        let roomsRepository = RoomsRepository(remoteDatasource: roomsRemoteDatasource, localDatasource: roomsLocalDatasource)
        let roomsUseCase = RoomsUseCase(repository: roomsRepository)

        let router = StashDetailRouter(viewController: viewController)
        viewController.viewModel = StashDetailViewModel( roomUseCase: roomsUseCase, stashesUseCase: stashesUseCase, room: room, router: router, stash: stash, typesStash: typesStash)
        return viewController
    }
}
