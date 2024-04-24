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
    func getUsers() throws {
        // TODO: - Call repository for take entity
    }
}
