//
//  RoomsDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol RoomsRemoteDatasourceProtocol {
    func getRooms(at userID: Int) async throws -> [RoomDTO]
    func getTypesRoom() async throws -> [TypesRoomDTO]
    func updateRoom(_ room: RoomDTO) async throws
    func insertRoom(_ room: RoomDTO) async throws
    func deleteRoom(_ room: RoomDTO) async throws
}
