//
//  LinkUseCaseProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 1/5/24.
//

import Foundation

protocol LinkUseCaseProtocol {
    func getContentRooms(with roomIDs: [Int], of rooms: [Room], of stashes: [Stash], at articles: [Article]) async throws -> [ContentRoom]
}
