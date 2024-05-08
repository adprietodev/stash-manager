//
//  ArticlesBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ArticlesBuilder {
    func build() -> ArticlesViewController {
        let viewController = ArticlesViewController(nibName: "ArticlesViewController", bundle: nil)

        let usersLocalDatasource = UsersLocalDatasource()
        let usersRemoteDatasource = UsersRemoteDatasource()
        let usersRepository = UsersRepository(remoteDatasource: usersRemoteDatasource, localDatasource: usersLocalDatasource)
        let usersUseCase = UsersUseCase(repository: usersRepository)

        let roomsRemoteDatasource = RoomsRemoteDatasource()
        let roomsLocalDatasource = RoomsLocalDatasource()
        let roomsRepository = RoomsRepository(remoteDatasource: roomsRemoteDatasource, localDatasource: roomsLocalDatasource)
        let roomsUseCase = RoomsUseCase(repository: roomsRepository)

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

        let router = ArticlesRouter(viewController: viewController)
        viewController.viewModel = ArticlesViewModel(router: router, usersUseCase: usersUseCase, roomsUseCase: roomsUseCase, stashesUseCase: stashesUseCase, linksUseCase: linksUseCase, articlesUseCase: articlesUseCase)
        return viewController
    }
}
