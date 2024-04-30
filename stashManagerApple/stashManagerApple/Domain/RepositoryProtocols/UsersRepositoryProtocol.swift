//
//  UserRepositoryProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol UsersRepositoryProtocol {
    func getRemoteUser(at authIDUser: UUID) async throws -> User
    func getLocalCurrentUser() throws -> User
    func setLocalCurrentUser(_ user: User) throws
    func removeCurrentUser()
}
