//
//  ArticlesRepositoryProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol ArticlesRepositoryProtocol {
    func getArticles(at userID: Int) async throws -> [Article]
    func getTypesArticle() async throws -> [TypeArticle]
}