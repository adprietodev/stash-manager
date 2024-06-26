//
//  StashesDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

struct StashDTO: Codable {
    let id: Int
    let name: String
    let description: String?
    let base64image: String?
    let idTypeStash: Int
    let idRoom: Int?
}
