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

        let roomsDatasource = RoomsDatasource()
        let roomsRepository = RoomsRepository(datasource: roomsDatasource)
        let roomsUseCase =  RoomsUseCase(repository: roomsRepository)

        let stashesDatasource = StashesDatasource()
        let stashesRepository = StashesRepository(datasource: stashesDatasource)
        let stashesUseCase = StashesUseCase(repository: stashesRepository)

        let articlesDatasource = ArticlesDatasource()
        let articlesRepository = ArticlesRepository(datasource: articlesDatasource)
        let articlesUseCase = ArticlesUseCase(repository: articlesRepository)

        let linksDatasource = LinkDatasource()
        let linksRepository = LinksRepository(datasource: linksDatasource)
        let linksUseCase = LinkUseCase(repository: linksRepository)

        viewController.viewModel = SplashViewModel(router: router, uuid: uuid, userUseCase: userUseCase, roomsUseCase: roomsUseCase, stashesUseCase: stashesUseCase, articlesUseCase: articlesUseCase, linksUseCase: linksUseCase)
        return viewController
    }
}
