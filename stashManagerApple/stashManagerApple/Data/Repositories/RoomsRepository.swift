//
//  RoomRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class RoomsRepository:RoomsRepositoryProtocol {
    let datasource: RoomsDatasourceProtocol

    init(datasource: RoomsDatasourceProtocol) {
        self.datasource = datasource
    }

    func getRooms(at userID: Int) async throws -> [Room] {
        let roomsDTO = try await datasource.getRooms(at: userID)
        return roomsDTO.map { $0.toDomain() }
    }

    func getTypesRoom() async throws -> [TypeRoom] {
        let typeRoomDTO = try await datasource.getTypesRoom()
        return typeRoomDTO.map {$0.toDomain()}
    }
}

fileprivate extension RoomDTO {
    func toDomain() -> Room {
        Room(id: self.id, name: self.name, image: self.image, description: self.description, typeRoom: self.typeRoom.toDomain())
    }
}

fileprivate extension TypesRoomDTO {
    func toDomain() -> TypeRoom {
        TypeRoom(id: self.id, name: self.name)
    }
}
