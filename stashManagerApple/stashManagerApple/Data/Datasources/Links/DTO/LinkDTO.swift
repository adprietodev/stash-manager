//
//  LinkDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

struct LinkDTO: Codable {
    let id, idRoom: Int
    let idStash: Int?
    let idArticle: Int?
    let stockArticle: Int?
}

