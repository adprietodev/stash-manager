//
//  UsersDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol UsersRemoteDatasourceProtocol {
    func getUser(at authIDUser: UUID) async throws -> [UserDTO]
}
