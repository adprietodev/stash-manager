//
//  ArticleRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ArticlesRepository: ArticlesRepositoryProtocol {
    let datasource: ArticlesDatasourceProtocol

    init(datasource: ArticlesDatasourceProtocol) {
        self.datasource = datasource
    }

    func getArticles(at userID: Int) async throws -> [Article] {
        let articleDTO = try await datasource.getArticles(at: userID)
        return articleDTO.map { $0.toDomain() }
    }

    func updateArticle(_ article: Article) async throws {
        try await datasource.updateArticle(article.toDTO())
    }

    func insertArticle(_ article: Article) async throws {
        try await datasource.insertArticle(article.toDTO())
    }

    func deleteArticle(_ article: Article) async throws {
        try await datasource.deleteArticle(article.toDTO())
    }

    func getTypesArticle() async throws -> [TypeArticle] {
        let typesArticleDTO = try await datasource.getTypesArticles()
        return typesArticleDTO.map { $0.toDomain() }
    }
}

fileprivate extension ArticleDTO {
    func toDomain() -> Article {
        Article(id: self.id,
                name: self.name,
                base64image: self.base64image ?? "",
                description: self.description ?? "",
                idUser: self.idUser,
                idTypeArticle: self.idTypeArticle)
    }
}

fileprivate extension TypeArticleDTO {
    func toDomain() -> TypeArticle {
        TypeArticle(id: self.id, name: TypesArticle(rawValue: self.name) ?? .none)
    }
}

fileprivate extension Article {
    func toDTO() -> ArticleDTO {
        ArticleDTO(id: self.id, name: self.name, base64image: self.base64image, description: self.description, idUser: self.idUser, idTypeArticle: self.idTypeArticle)
    }
}
