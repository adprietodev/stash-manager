//
//  StashesRepositoryProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol StashesRepositoryProtocol {
    func getRemoteStashes() async throws -> [Stash]
    func getRemoteTypesStash() async throws -> [TypeStash]
    func getSelectedStash() throws -> Stash?
    func setSelectedStash(_ stash: Stash) throws
    func removeSelectedStash()
    func updateStash(_ stash: Stash) async throws
    func insertStash(_ stash: Stash) async throws
}
