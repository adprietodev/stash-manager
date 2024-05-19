//
//  ArticleDetailBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleDetailBuilder {
    func build(article: Article, typesArticle: [TypeArticle], selectedRoom: ContentRoom, selectedStash: ContentStash) -> ArticleDetailViewController {
        let viewController = ArticleDetailViewController(nibName: "ArticleDetailViewController", bundle: nil)
        let router = ArticleDetailRouter(viewController: viewController)
        let articlesDatasource = ArticlesDatasource()
        let articlesRepository = ArticlesRepository(datasource: articlesDatasource)
        let articlesUseCase = ArticlesUseCase(repository: articlesRepository)
        viewController.viewModel = ArticleDetailViewModel(router: router, articleUseCase: articlesUseCase, article: article, typesArticle: typesArticle, selectedRoom: selectedRoom, selectedStash: selectedStash)
        return viewController
    }
}
