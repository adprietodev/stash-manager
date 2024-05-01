//
//  UserRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class UsersRepository {
    let remoteDatasource: UsersRemoteDatasourceProtocol
    let localDatasource: UsersLocalDatasourceProtocol

    init(remoteDatasource: UsersRemoteDatasourceProtocol, localDatasource: UsersLocalDatasourceProtocol) {
        self.remoteDatasource = remoteDatasource
        self.localDatasource = localDatasource
    }
}

extension UsersRepository: UsersRepositoryProtocol {
    func getRemoteUser(at authIDUser: UUID) async throws -> [User] {
        let userDTO = try await remoteDatasource.getUser(at: authIDUser)
        return userDTO.map { $0.toDomain() }
    }

    func getLocalCurrentUser() throws -> User {
        let userDTO = try localDatasource.getLocalCurrentUser()
        guard let userDTO else { return User(id: 0,idAuth: "", name: "", lastname: "", base64image: "", email: "")}
        return userDTO.toDomain()
    }

    func setLocalCurrentUser(_ user: User) throws {
        try localDatasource.setLocalCurrentUser(user.toDTO())
    }

    func removeCurrentUser() {
        localDatasource.removeLocalCurrentUser()
    }
}

fileprivate extension UserDTO {
    func toDomain() -> User {
        User(id: self.id,idAuth: self.idAuthUser, name: self.name, lastname: self.lastname, base64image: self.base64image, email: self.email)
    }
}

fileprivate extension User {
    func toDTO() -> UserDTO {
        UserDTO(id: self.id, idAuthUser: self.idAuth, name: self.name, lastname: self.lastname, base64image: self.base64image, email: self.email)
    }
}
