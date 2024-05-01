//
//  StashesDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol StashesDatasourceProtocol {
    func getStashes() async throws -> [StashesDTO]
    func getTypesStash() async throws -> [TypeStashDTO]
}
