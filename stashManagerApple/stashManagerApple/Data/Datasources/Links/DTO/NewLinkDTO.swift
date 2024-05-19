//
//  NewLinkDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 18/5/24.
//

import Foundation
struct NewLinkDTO: Codable {
    var id, idRoom: Int?
    var idStash: Int?
    var idArticle: Int?
    var stockArticle: Int?
}
