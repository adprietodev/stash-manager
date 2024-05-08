//
//  ArticleDetailViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleDetailViewModel: ArticleDetailViewModelProtocol {
    let router: ArticleDetailRouterProtocol
    var article: Article
    var typesArticle: [TypeArticle]

    init(router: ArticleDetailRouterProtocol, article: Article, typesArticle: [TypeArticle]) {
        self.router = router
        self.article = article
        self.typesArticle = typesArticle
    }

    func goToEdit() {
        router.goToEdit(article: article, typesArticle: typesArticle)
    }
}
