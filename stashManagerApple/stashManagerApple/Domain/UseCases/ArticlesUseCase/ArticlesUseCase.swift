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
}
