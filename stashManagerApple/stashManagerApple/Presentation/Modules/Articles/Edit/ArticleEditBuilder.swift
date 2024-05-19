//
//  ArticleEditBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleEditBuilder {
    func build(article: Article, typesArticle: [TypeArticle], typeAction: TypeAction) -> ArticleEditViewController {
        let viewController = ArticleEditViewController(nibName: "ArticleEditViewController", bundle: nil)

        let linksRemoteDatasource = LinkRemoteDatasource()
        let linksLocalDatasource = LinksLocalDatasource()
        let linksRepository = LinksRepository(remoteDatasource: linksRemoteDatasource, localDatasource: linksLocalDatasource)
        let linksUseCase = LinkUseCase(repository: linksRepository)

        let articlesDatasource = ArticlesDatasource()
        let articlesRepository = ArticlesRepository(datasource: articlesDatasource)
        let articlesUseCase = ArticlesUseCase(repository: articlesRepository)

        let userRemoteDatasource = UsersRemoteDatasource()
        let userLocalDatasource = UsersLocalDatasource()
        let userRepository = UsersRepository(remoteDatasource: userRemoteDatasource, localDatasource: userLocalDatasource)
        let userUseCase = UsersUseCase(repository: userRepository)

        let router = ArticleEditRouter(viewController: viewController)
        viewController.viewModel = ArticleEditViewModel(router: router, linksUseCase: linksUseCase, articleUseCase: articlesUseCase, userUseCase: userUseCase, article: article, typesArticle: typesArticle, typeAction: typeAction)
        return viewController
    }
}
