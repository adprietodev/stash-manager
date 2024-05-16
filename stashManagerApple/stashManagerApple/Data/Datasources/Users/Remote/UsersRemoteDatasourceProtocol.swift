//
//  UsersDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol UsersRemoteDatasourceProtocol {
    func getUser(at authIDUser: UUID) async throws -> [UserDTO]
    func updateUser(_ user: UserDTO) async throws
    func insertUser(_ user: UserDTO) async throws
}
