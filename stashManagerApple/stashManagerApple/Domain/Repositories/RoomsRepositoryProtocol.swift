//
//  RoomsRepositoryProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol RoomsRepositoryProtocol {
    func getRemoteRooms(at userID: Int) async throws -> [Room]
    func getRemoteTypesRoom() async throws -> [TypeRoom]
    func getLocalSelectedRoom() throws -> Room?
    func setLocalSelectedRoom(_ room: Room) throws
    func removeLocalSelectedRoom()
    func updateRoom(_ room: Room) async throws
    func insertRoom(_ room: Room) async throws
    func deleteRoom(_ room: Room) async throws
}
