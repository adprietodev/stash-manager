//
//  RoomsUseCaseProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol RoomsUseCaseProtocol {
    func getRooms(at userID: Int) async throws -> [Room]
    func getTypesRoom() async throws -> [TypeRoom]
    func getSelectedRoom() throws -> Room?
    func setSelectedRoom(_ room: Room) throws
    func removeSelectedRoom()
    func updateRoom(_ room: Room) async throws
    func insertRoom(_ room: Room) async throws
    func deleteRoom(_ room: Room) async throws
}
