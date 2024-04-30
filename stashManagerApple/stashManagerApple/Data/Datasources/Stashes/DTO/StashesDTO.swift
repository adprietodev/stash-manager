//
//  StashesDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

struct StashesDTO: Codable {
    let id: Int
    let name: String
    let description: String?
    let image: String?
    let typeStash: TypeStashDTO

    enum CodingKeys: String, CodingKey {
        case id, name,description, image
        case typeStash = "types_stash"
    }
}
