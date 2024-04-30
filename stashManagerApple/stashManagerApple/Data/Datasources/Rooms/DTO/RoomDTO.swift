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
    let description: String?
    let typeRoom: TypesRoomDTO

    enum CodingKeys: String, CodingKey {
        case id, name, image, description
        case typeRoom = "types_room"
    }
}
