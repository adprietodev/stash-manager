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
}
