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
    let base64image: String?
    let description, color, expirationDate: String?
    let isAlcoholic: Bool?
    let mililitres, weight: Int?
    let brand: String?
    let isSpice, isSpicy: Bool?
    let material: String?
    let idUser: Int
    let idTypeArticle: Int

    enum CodingKeys: String, CodingKey {
        case id, name, base64image, description, color, expirationDate, isAlcoholic, weight, brand, isSpice, isSpicy, material, idUser,idTypeArticle
        case mililitres = "mL"
    }
}
