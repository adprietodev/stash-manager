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
}
