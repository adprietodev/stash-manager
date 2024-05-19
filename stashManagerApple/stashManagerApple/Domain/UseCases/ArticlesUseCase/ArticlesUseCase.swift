//
//  ArticlesUseCase.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ArticlesUseCase: ArticlesUseCaseProtocol {
    let repository: ArticlesRepositoryProtocol

    init(repository: ArticlesRepositoryProtocol) {
        self.repository = repository
    }

    func getArticles(at userID: Int) async throws -> [Article] {
        try await repository.getArticles(at: userID)
    }

    func getTypesArticle() async throws -> [TypeArticle] {
        try await repository.getTypesArticle()
    }

    func getArticle(at articleID: Int) async throws -> Article {
        try await repository.getArticle(at: articleID)
    }

    func updateArticle(_ article: Article) async throws {
        try await repository.updateArticle(article)
    }

    func insertArticle(_ article: Article) async throws {
        try await repository.insertArticle(article)
    }

    func deleteArticle(_ article: Article) async throws {
        try await repository.deleteArticle(article)
    }
}
