//
//  StashEditBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashEditBuilder {
    func build(stash: Stash, typesStash: [TypeStash], typeAction: TypeAction, room: Room) -> StashEditViewController {
        let viewController = StashEditViewController()

        let linksRemoteDatasource = LinkRemoteDatasource()
        let linksLocalDatasource = LinksLocalDatasource()
        let linksRepository = LinksRepository(remoteDatasource: linksRemoteDatasource, localDatasource: linksLocalDatasource)
        let linksUseCase = LinkUseCase(repository: linksRepository)

        let router = StashEditRouter(viewController: viewController)
        viewController.viewModel = StashEditViewModel(router: router, linksUseCase: linksUseCase, stash: stash, typesStash: typesStash, typeAction: typeAction, room: room)
        return viewController
    }
}
