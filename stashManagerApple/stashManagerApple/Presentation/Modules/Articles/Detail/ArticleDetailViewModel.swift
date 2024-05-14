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
    var selectedRoom: ContentRoom
    var selectedStash: ContentStash

    init(router: ArticleDetailRouterProtocol, article: Article, typesArticle: [TypeArticle], selectedRoom: ContentRoom, selectedStash: ContentStash) {
        self.router = router
        self.article = article
        self.typesArticle = typesArticle
        self.selectedRoom = selectedRoom
        self.selectedStash = selectedStash
    }

    func goToEdit() {
        router.goToEditArticle(article, typesArticle: typesArticle,selectedRoom: selectedRoom, selectedStash: selectedStash)
    }

    func getTypeArticle() -> TypesArticle {
        guard let type = typesArticle.filter({ $0.id == article.idTypeArticle}).first?.name else { return TypesArticle.none }
        return type
    }
}
