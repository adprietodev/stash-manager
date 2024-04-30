//
//  RoomsRepositoryProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol RoomsRepositoryProtocol{
    func getRooms(at userID: Int) async throws -> [Room]
    func getTypesRoom() async throws -> [TypeRoom]
}
