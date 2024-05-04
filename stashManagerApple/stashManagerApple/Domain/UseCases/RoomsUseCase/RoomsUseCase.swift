//
//  RoomsUseCase.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class RoomsUseCase: RoomsUseCaseProtocol {
    // MARK: - Properties
    let repository: RoomsRepositoryProtocol

    init(repository: RoomsRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Functions
    func getRooms(at userID: Int) async throws -> [Room] {
        try await repository.getRemoteRooms(at: userID)
    }

    func getTypesRoom() async throws -> [TypeRoom] {
        try await repository.getRemoteTypesRoom()
    }
}
