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
    let description: String?
    let idUser: Int
    let idTypeArticle: Int
}
