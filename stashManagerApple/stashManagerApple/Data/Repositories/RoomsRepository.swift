//
//  RoomRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class RoomsRepository:RoomsRepositoryProtocol {
    let remoteDatasource: RoomsRemoteDatasourceProtocol
    let localDatasource: RoomsLocalDatasourceProtocol

    init(remoteDatasource: RoomsRemoteDatasourceProtocol, localDatasource: RoomsLocalDatasourceProtocol) {
        self.remoteDatasource = remoteDatasource
        self.localDatasource = localDatasource
    }

    func getRemoteRooms(at userID: Int) async throws -> [Room] {
        let roomsDTO = try await remoteDatasource.getRooms(at: userID)
        return roomsDTO.map { $0.toDomain() }
    }

    func getRemoteTypesRoom() async throws -> [TypeRoom] {
        let typeRoomDTO = try await remoteDatasource.getTypesRoom()
        return typeRoomDTO.map {$0.toDomain()}
    }

    func updateRoom(_ room: Room) async throws {
        try await remoteDatasource.updateRoom(room.toDTO())
    }

    func insertRoom(_ room: Room) async throws {
        try await remoteDatasource.insertRoom(room.toDTO())
    }

    func getLocalSelectedRoom() throws -> Room? {
        let roomDTO = try localDatasource.getSelectedRoom()
        return roomDTO?.toDomain()
    }

    func setLocalSelectedRoom(_ room: Room) throws {
        try localDatasource.setSelectedRoom(room.toDTO())
    }

    func removeLocalSelectedRoom() {
        localDatasource.removeSelectedRoom()
    }
}

fileprivate extension RoomDTO {
    func toDomain() -> Room {
        Room(id: self.id,
             name: self.name,
             base64image: self.base64image ?? "",
             description: self.description ?? "",
             idTypeRoom: self.idTypeRoom)
    }
}

fileprivate extension TypesRoomDTO {
    func toDomain() -> TypeRoom {
        TypeRoom(id: self.id, name: TypesRoom(rawValue: self.name) ?? .none)
    }
}

fileprivate extension Room {
    func toDTO() -> RoomDTO {
        RoomDTO(id: self.id,
                name: self.name,
                base64image: self.base64image,
                description: self.description,
                idTypeRoom: self.idTypeRoom)
    }
}
