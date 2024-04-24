//
//  UserRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class UsersRepository {
    let datasource: UsersDatasourceProtocol

    init(datasource: UsersDatasourceProtocol) {
        self.datasource = datasource
    }
}

extension UsersRepository: UsersRepositoryProtocol {
    func getUsers() throws {
        // TODO: - UserDTO at User(Entity) conversion
    }
}

// TODO: - Logic to conversión ( fileprivate extension UserDTO )
