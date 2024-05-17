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

    func updateArticle(_ article: ArticleDTO) async throws  {
        try await supabase.from("articles").update(article).eq("id", value: article.id).execute()
    }

    func insertArticle(_ article: ArticleDTO) async throws {
        let newArticle = NewArticleDTO(name: article.name, base64image: article.base64image, description: article.description, idUser: article.idUser, idTypeArticle: article.idTypeArticle)
        try await supabase.from("articles").insert(newArticle).execute()
    }

    func deleteArticle(_ article: ArticleDTO) async throws {
        try await supabase.from("article").delete().eq("id", value: article.id).execute()
    }
}
