//
//  AuthenticationUseCase.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation
import Supabase

class AuthenticationUseCase {
    let repository: AuthenticationRepositoryProtocol

    init(repository: AuthenticationRepositoryProtocol) {
        self.repository = repository
    }
}

extension AuthenticationUseCase: AuthenticationUseCaseProtocol {
    func signInWithEmailAndPassword(_ email: String, _ password: String) async throws -> Session {
        try await repository.signInWithEmailAndPassword(email, password)
    }

    func signOutCurrentUser() async throws {
        try await repository.signOutCurrentUser()
    }
}
