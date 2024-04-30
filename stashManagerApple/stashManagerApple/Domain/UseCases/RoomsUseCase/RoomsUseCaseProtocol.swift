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
}
