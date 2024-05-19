//
//  ArticlesDatasourceProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol ArticlesDatasourceProtocol {
    func getArticles(at userID: Int) async throws -> [ArticleDTO]
    func getTypesArticles() async throws -> [TypeArticleDTO]
    func updateArticle(_ article: ArticleDTO) async throws
    func insertArticle(_ article: ArticleDTO) async throws
    func deleteArticle(_ article: ArticleDTO) async throws
    func getArticle(at articleID: Int) async throws -> [ArticleDTO] 
}
