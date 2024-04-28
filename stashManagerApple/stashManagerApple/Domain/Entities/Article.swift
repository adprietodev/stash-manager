//
//  Article.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

struct Article {
    let id: Int
    let name: String
    let image: String?
    let description, color, expirationDate: String?
    let isAlcoholic: Bool?
    let mililitres, weight: Int?
    let brand: String?
    let isSpice, isSpicy: Bool?
    let material: String?
    let idTypeArticle, idUser: Int
    let typeArticle: TypeArticle
}
