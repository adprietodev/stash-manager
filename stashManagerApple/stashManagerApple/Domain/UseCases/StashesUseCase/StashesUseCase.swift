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
        try await repository.getRemoteStashes()
    }

    func updateStash(_ stash: Stash) async throws {
        try await repository.updateStash(stash)
    }

    func insertStash(_ stash: Stash) async throws {
        try await repository.insertStash(stash)
    }

    func getTypesStash() async throws -> [TypeStash] {
        try await repository.getRemoteTypesStash()
    }

    func getSelectedStash() throws -> Stash? {
        try repository.getSelectedStash()
    }

    func setSelectedStash(_ stash: Stash) throws {
        try repository.setSelectedStash(stash)
    }

    func removeSelectedStash() {
        repository.removeSelectedStash()
    }
}
