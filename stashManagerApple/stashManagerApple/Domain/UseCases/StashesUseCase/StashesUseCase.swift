//
//  StashesUseCase.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class StashesUseCase: StashesUseCaseProtocol {
    let repository: StashesRepositoryProtocol

    init(repository: StashesRepositoryProtocol) {
        self.repository = repository
    }

    func getStashes() async throws -> [Stash] {
        try await repository.getStashes()
    }

    func getTypesStash() async throws -> [TypeStash] {
        try await repository.getTypesStash()
    }
}
