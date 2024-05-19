//
//  AArticlesUseCaseProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol ArticlesUseCaseProtocol {
    func getArticles(at userID: Int) async throws -> [Article]
    func getTypesArticle() async throws -> [TypeArticle]
    func updateArticle(_ article: Article) async throws
    func insertArticle(_ article: Article) async throws
    func deleteArticle(_ article: Article) async throws
    func getArticle(at articleID: Int) async throws -> Article
}
