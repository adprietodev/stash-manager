//
//  RoomsDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol RoomsDatasourceProtocol {
    func getRooms(at userID: Int) async throws -> [RoomDTO]
    func getTypesRoom() async throws -> [TypesRoomDTO]
}
