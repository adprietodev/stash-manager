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
        viewController.viewModel = ArticleDetailViewModel(router: router, article: article, typesArticle: typesArticle, selectedRoom: selectedRoom, selectedStash: selectedStash)
        return viewController
    }
}
