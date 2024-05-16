//
//  UsersUseCaseProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

protocol UsersUseCaseProtocol {
    func getUser(at authIDUser: UUID) async throws -> [User]
    func getCurrentUser() throws -> User
    func setCurrentUser(_ user: User) throws
    func removeCurrentUser()
    func updateUser(_ user: User) async throws
    func insertUser(_ user: User) async throws 
}
