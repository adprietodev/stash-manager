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
        viewController.viewModel = ArticleEditViewModel(article: article, typesArticle: typesArticle)
        return viewController
    }
}
