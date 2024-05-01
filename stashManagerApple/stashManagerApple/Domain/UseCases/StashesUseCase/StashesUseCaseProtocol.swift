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
}
