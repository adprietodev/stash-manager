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
    let image: String
    let idUser, idTypeRoom: Int
    let description: String?
    let typeRoom: TypeRoom

    enum CodingKeys: String, CodingKey {
        case id, name, image, idUser, idTypeRoom, description
        case typeRoom = "types_room"
    }
}
