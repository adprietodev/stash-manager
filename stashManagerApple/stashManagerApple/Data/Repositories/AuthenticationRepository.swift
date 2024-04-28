//
//  AuthenticationRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation

class AuthenticationRepository {
    // MARK: - Properties
    var datasource:  AuthenticationDatasourceProtocol
    
    init(datasource: AuthenticationDatasourceProtocol) {
        self.datasource = datasource
    }
}

extension AuthenticationRepository: AuthenticationRepositoryProtocol {
    func signInWithEmailAndPassword(_ email: String, _ password: String) async throws -> Bool {
        try await datasource.signInWithEmailAndPassword(email, password)
    }
}
