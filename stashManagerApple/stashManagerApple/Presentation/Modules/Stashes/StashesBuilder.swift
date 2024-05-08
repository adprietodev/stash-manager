//
//  StashesBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class StashesBuilder {
    func build() -> StashesViewController {
        let viewController = StashesViewController(nibName: "StashesViewController", bundle: nil)
        let router = StashesRouter(viewController: viewController)

        let stashesRemoteDatasource = StashesRemoteDatasource()
        let stashesLocalDatasource = StashesLocalDatasource()
        let stashesRepository = StashesRepository(remoteDatasource: stashesRemoteDatasource, localDatasource: stashesLocalDatasource)
        let stashesUseCase = StashesUseCase(repository: stashesRepository)

        let roomsRemoteDatasource = RoomsRemoteDatasource()
        let roomsLocalDatasource = RoomsLocalDatasource()
        let roomsRepository = RoomsRepository(remoteDatasource: roomsRemoteDatasource, localDatasource: roomsLocalDatasource)
        let roomsUseCase = RoomsUseCase(repository: roomsRepository)

        let linksRemoteDatasource = LinkRemoteDatasource()
        let linksLocalDatasource = LinksLocalDatasource()
        let linksRepository = LinksRepository(remoteDatasource: linksRemoteDatasource, localDatasource: linksLocalDatasource)
        let linksUseCase = LinkUseCase(repository: linksRepository)

        viewController.viewModel = StashesViewModel(router: router, roomsUseCase: roomsUseCase, stashesUseCase: stashesUseCase, linksUseCase: linksUseCase)
        return viewController
    }
}
