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
    var currentType: String = ""
    let router:  ArticleEditRouterProtocol

    init(router: ArticleEditRouterProtocol, article: Article, typesArticle: [TypeArticle]) {
        self.router = router
        self.article = article
        self.typesArticle = typesArticle
    }

    func setCurrentType() {
        guard let type = typesArticle.filter({ $0.id == article.idTypeArticle }).first?.name.rawValue else { return }
        currentType = type
    }

    func showCustomPickerType() {
        router.showCustomPickerType(typeScreen: .article, typeSelected: currentType)
    }
}
