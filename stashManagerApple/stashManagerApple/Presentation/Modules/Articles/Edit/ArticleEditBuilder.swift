//
//  ArticleEditBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleEditBuilder {
    func build(article: Article, typesArticle: [TypeArticle]) -> ArticleEditViewController {
        let viewController = ArticleEditViewController(nibName: "ArticleEditViewController", bundle: nil)
        let router = ArticleEditRouter(viewController: viewController)
        viewController.viewModel = ArticleEditViewModel(router: router, article: article, typesArticle: typesArticle)
        return viewController
    }
}
