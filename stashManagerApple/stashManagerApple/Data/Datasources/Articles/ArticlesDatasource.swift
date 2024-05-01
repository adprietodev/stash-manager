//
//  ArticlesDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ArticlesDatasource: ArticlesDatasourceProtocol {
    let supabase = SupabaseConfig.shared.supabase

    func getArticles(at userID: Int) async throws -> [ArticleDTO] {
        try await supabase.from("articles").select().execute().value
    }

    func getTypesArticles() async throws -> [TypeArticleDTO] {
        try await supabase.from("types_article").select().execute().value
    }
}
