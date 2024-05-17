//
//  StashesUseCaseProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol StashesUseCaseProtocol {
    func getStashes() async throws -> [Stash]
    func getTypesStash() async throws -> [TypeStash]
    func getSelectedStash() throws -> Stash?
    func setSelectedStash(_ stash: Stash) throws
    func removeSelectedStash()
    func updateStash(_ stash: Stash) async throws
    func insertStash(_ stash: Stash) async throws
    func deleteStash(_ stash: Stash) async throws
}
