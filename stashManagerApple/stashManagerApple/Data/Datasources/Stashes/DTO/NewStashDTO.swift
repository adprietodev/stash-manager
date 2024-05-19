//
//  NewStashDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 17/5/24.
//

import Foundation

struct NewStashDTO: Codable {
    let name: String
    let description: String?
    let base64image: String?
    let idTypeStash: Int
}
