//
//  ArticleEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleEditViewModel: ArticleEditViewModelProtocol {
    let linksUseCase: LinkUseCaseProtocol
    let articleUseCase: ArticlesUseCaseProtocol
    let userUseCase: UsersUseCaseProtocol
    var article: Article
    var typesArticle: [TypeArticle]
    var currentType: String = ""
    let router:  ArticleEditRouterProtocol
    var typeAction: TypeAction
    var typeButtonPressed: TypeButtonPressed?

    init(router: ArticleEditRouterProtocol, linksUseCase: LinkUseCaseProtocol, articleUseCase: ArticlesUseCaseProtocol, userUseCase: UsersUseCaseProtocol, article: Article, typesArticle: [TypeArticle], typeAction: TypeAction) {
        self.linksUseCase = linksUseCase
        self.router = router
        self.article = article
        self.typesArticle = typesArticle
        self.typeAction = typeAction
        self.articleUseCase = articleUseCase
        self.userUseCase = userUseCase
    }

    func setNameArticle(_ name: String) {
        article.name = name
    }

    func setDescription(_ description: String) {
        article.description = description
    }

    func setCurrentType() {
        guard let type = typesArticle.filter({ $0.id == article.idTypeArticle }).first?.name.rawValue else { return }
        currentType = type
    }

    func setTypeArticle(_ nameType: String) {
        typesArticle.forEach( {
            if $0.name.rawValue.localized == nameType {
                article.idTypeArticle = $0.id
            }
        })
    }

    func showCustomPickerType() {
        router.showCustomPickerType(typeScreen: .article, typeSelected: currentType, typeAction: typeAction, typeButtonPressed: .type)
    }
    
    func updateArticle() {
        Task {
            do {
                try await articleUseCase.updateArticle(article)
                router.finishEditOrAddArticle()
            } catch {
                // TODO: - Control error
            }
        }
    }

    func addArticleUser() {
        Task {
            do {
                let user = try userUseCase.getCurrentUser()
                article.idUser = user.id
                try await articleUseCase.insertArticle(article)
                router.finishEditOrAddArticle()
            } catch {
                // TODO: - Control error
            }
        }
    }
}
