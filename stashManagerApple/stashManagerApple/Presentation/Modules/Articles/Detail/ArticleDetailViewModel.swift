//
//  ArticleDetailViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleDetailViewModel: ArticleDetailViewModelProtocol {
    let router: ArticleDetailRouterProtocol
    let articleUseCase: ArticlesUseCaseProtocol
    var article: Article
    var typesArticle: [TypeArticle]
    var selectedRoom: ContentRoom
    var selectedStash: ContentStash
    var loadView: (() -> Void)?

    init(router: ArticleDetailRouterProtocol, articleUseCase: ArticlesUseCaseProtocol, article: Article, typesArticle: [TypeArticle], selectedRoom: ContentRoom, selectedStash: ContentStash) {
        self.router = router
        self.article = article
        self.typesArticle = typesArticle
        self.selectedRoom = selectedRoom
        self.selectedStash = selectedStash
        self.articleUseCase = articleUseCase
    }

    func goToEdit() {
        router.goToEditArticle(article, typesArticle: typesArticle,selectedRoom: selectedRoom, selectedStash: selectedStash)
    }

    func getTypeArticle() -> TypesArticle {
        guard let type = typesArticle.filter({ $0.id == article.idTypeArticle}).first?.name else { return TypesArticle.none }
        return type
    }

    func updateArticle() {
        Task {
            do {
                article = try await articleUseCase.getArticle(at: article.id)
                loadView?()
            } catch {
            }
        }
    }
}
