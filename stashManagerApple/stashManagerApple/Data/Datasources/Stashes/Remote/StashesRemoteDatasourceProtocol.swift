//
//  StashesDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol StashesRemoteDatasourceProtocol {
    func getStashes() async throws -> [StashDTO]
    func getTypesStash() async throws -> [TypeStashDTO]
    func updateStash(_ stash: StashDTO) async throws
    func insertStash(_ stash: StashDTO) async throws
    func deleteStash(_ stash: StashDTO) async throws
}
