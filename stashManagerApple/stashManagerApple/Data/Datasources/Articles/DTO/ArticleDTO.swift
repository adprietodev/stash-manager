//
//  ArticleDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

// MARK: - WelcomeElement
struct ArticleDTO: Codable {
    let id: Int
    let name: String
    let image: String?
    let description, color, expirationDate: String?
    let isAlcoholic: Bool?
    let mL, weight: Int?
    let brand: String?
    let isSpice, isSpicy: Bool?
    let material: String?
    let idTypeArticle, idUser: Int
    let typeArticle: TypeArticleDTO

    enum CodingKeys: String, CodingKey {
        case id, name, image, description, color, expirationDate, isAlcoholic, mL, weight, brand, isSpice, isSpicy, material, idTypeArticle, idUser
        case typeArticle = "types_article"
    }
}
