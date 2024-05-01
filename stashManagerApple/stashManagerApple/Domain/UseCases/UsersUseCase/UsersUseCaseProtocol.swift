//
//  UsersUseCaseProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol UsersUseCaseProtocol {
    func getUser(at authIDUser: UUID) async throws -> [User]
}
