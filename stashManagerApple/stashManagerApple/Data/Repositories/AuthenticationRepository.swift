//
//  AuthenticationRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation
import Supabase

class AuthenticationRepository {
    // MARK: - Properties
    var datasource:  AuthenticationDatasourceProtocol
    
    init(datasource: AuthenticationDatasourceProtocol) {
        self.datasource = datasource
    }
}

extension AuthenticationRepository: AuthenticationRepositoryProtocol {
    func signInWithEmailAndPassword(_ email: String, _ password: String) async throws -> Session {
        try await datasource.signInWithEmailAndPassword(email, password)
    }
}
