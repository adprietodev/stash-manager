//
//  SplashBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import UIKit

class SplashBuilder {
    func build(uuid: UUID) -> SplashViewController {
        let viewController = SplashViewController(nibName: "SplashViewController", bundle: nil)
        let router = SplashRouter(viewController: viewController)

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

        let articlesDatasource = ArticlesDatasource()
        let articlesRepository = ArticlesRepository(datasource: articlesDatasource)
        let articlesUseCase = ArticlesUseCase(repository: articlesRepository)

        let linksRemoteDatasource = LinkRemoteDatasource()
        let linksLocalDatasource = LinksLocalDatasource()
        let linksRepository = LinksRepository(remoteDatasource: linksRemoteDatasource, localDatasource: linksLocalDatasource)
        let linksUseCase = LinkUseCase(repository: linksRepository)

        viewController.viewModel = SplashViewModel(router: router, uuid: uuid, userUseCase: userUseCase, roomsUseCase: roomsUseCase, stashesUseCase: stashesUseCase, articlesUseCase: articlesUseCase, linksUseCase: linksUseCase)
        return viewController
    }
}
