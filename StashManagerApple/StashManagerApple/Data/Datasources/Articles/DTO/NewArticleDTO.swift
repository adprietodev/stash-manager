//
//  newArticleDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 17/5/24.
//

import Foundation

struct NewArticleDTO: Codable {
    let name: String
    let base64image: String?
    let description: String?
    let idUser: Int
    let idTypeArticle: Int
}
