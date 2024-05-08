//
//  ArticleEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleEditViewModel: ArticleEditViewModelProtocol {
    var article: Article
    var typesArticle: [TypeArticle]

    init(article: Article, typesArticle: [TypeArticle]) {
        self.article = article
        self.typesArticle = typesArticle
    }
}
