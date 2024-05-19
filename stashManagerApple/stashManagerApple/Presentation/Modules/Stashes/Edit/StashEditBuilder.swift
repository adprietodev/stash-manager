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

        let userRemoteDatasource = UsersRemoteDatasource()
        let userLocalDatasource = UsersLocalDatasource()
        let userRepository = UsersRepository(remoteDatasource: userRemoteDatasource, localDatasource: userLocalDatasource)
        let userUseCase = UsersUseCase(repository: userRepository)
        
        let roomsRemoteDatasource = RoomsRemoteDatasource()
        let roomsLocalDatasource = RoomsLocalDatasource()
        let roomsRepository = RoomsRepository(remoteDatasource: roomsRemoteDatasource, localDatasource: roomsLocalDatasource)
        let roomsUseCase =  RoomsUseCase(repository: roomsRepository)

        let stashesRemoteDatasource = StashesRemoteDatasource()
        let stashesLocalDatasource = StashesLocalDatasource()
        let stashesRepository = StashesRepository(remoteDatasource: stashesRemoteDatasource, localDatasource: stashesLocalDatasource)
        let stashesUseCase = StashesUseCase(repository: stashesRepository)

        let linksRemoteDatasource = LinkRemoteDatasource()
        let linksLocalDatasource = LinksLocalDatasource()
        let linksRepository = LinksRepository(remoteDatasource: linksRemoteDatasource, localDatasource: linksLocalDatasource)
        let linksUseCase = LinkUseCase(repository: linksRepository)
    
        let articlesDatasource = ArticlesDatasource()
        let articlesRepository = ArticlesRepository(datasource: articlesDatasource)
        let articlesUseCase = ArticlesUseCase(repository: articlesRepository)

        let router = StashEditRouter(viewController: viewController)
        viewController.viewModel = StashEditViewModel(router: router, linksUseCase: linksUseCase, roomsUseCase: roomsUseCase, stashesUseCase: stashesUseCase, userUseCase: userUseCase, articleUseCase: articlesUseCase, stash: stash, typesStash: typesStash, typeAction: typeAction, room: room)
        return viewController
    }
}
