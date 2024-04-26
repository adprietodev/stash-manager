//
//  UserDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

struct UserDTO: Codable {
    let id: Int
    let idAuthUser: String
    let name: String
    let lastname: String
    let image: String
    let email: String
    let articles: [ArticleDTO]

    enum CodingKeys: String, CodingKey {
        case id
        case idAuthUser = "id_authUser"
        case name, lastname, image, email, articles
    }
}
