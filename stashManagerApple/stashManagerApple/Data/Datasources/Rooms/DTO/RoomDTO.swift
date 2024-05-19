//
//  RoomsDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

struct RoomDTO: Codable {
    let id: Int
    let name: String
    let base64image: String?
    let description: String?
    let idTypeRoom: Int
    let idUser: Int
}
