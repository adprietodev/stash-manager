//
//  Room.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

struct Room: Codable {
    let id: Int
    let name: String
    let image: String
    let description: String?
    let typeRoom: TypeRoom
}
