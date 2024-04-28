//
//  UsersUseCase.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class UsersUseCase {
    let repository: UsersRepositoryProtocol

    init(repository: UsersRepositoryProtocol) {
        self.repository = repository
    }
}

extension UsersUseCase: UsersUseCaseProtocol {
    func getUser(at authIDUser: UUID) async throws -> User {
        try await repository.getUser(at: authIDUser)
    }
}
