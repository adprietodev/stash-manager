//
//  ArticleEditBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleEditBuilder {
    func build(article: Article, typesArticle: [TypeArticle], typeAction: TypeAction, selectedRoom: ContentRoom, selectedStash: ContentStash) -> ArticleEditViewController {
        let viewController = ArticleEditViewController(nibName: "ArticleEditViewController", bundle: nil)

        let linksRemoteDatasource = LinkRemoteDatasource()
        let linksLocalDatasource = LinksLocalDatasource()
        let linksRepository = LinksRepository(remoteDatasource: linksRemoteDatasource, localDatasource: linksLocalDatasource)
        let linksUseCase = LinkUseCase(repository: linksRepository)

        let router = ArticleEditRouter(viewController: viewController)
        viewController.viewModel = ArticleEditViewModel(router: router, linksUseCase: linksUseCase, article: article, typesArticle: typesArticle, typeAction: typeAction, selectedRoom: selectedRoom, selectedStash: selectedStash)
        return viewController
    }
}
