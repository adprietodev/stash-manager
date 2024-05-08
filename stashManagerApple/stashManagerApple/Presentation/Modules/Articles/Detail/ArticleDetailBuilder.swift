//
//  ArticleDetailBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleDetailBuilder {
    func build(article: Article, typesArticle: [TypeArticle]) -> ArticleDetailViewController {
        let viewController = ArticleDetailViewController(nibName: "ArticleDetailViewController", bundle: nil)
        let router = ArticleDetailRouter(viewController: viewController)
        viewController.viewModel = ArticleDetailViewModel(router: router, article: article, typesArticle: typesArticle)
        return viewController
    }
}
