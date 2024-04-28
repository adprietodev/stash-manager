//
//  AuthenticationUseCase.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation

class AuthenticationUseCase {
    let repository: AuthenticationRepositoryProtocol

    init(repository: AuthenticationRepositoryProtocol) {
        self.repository = repository
    }
}

extension AuthenticationUseCase: AuthenticationUseCaseProtocol {
    func signInWithEmailAndPassword(_ email: String, _ password: String) async throws -> Bool {
        try await repository.signInWithEmailAndPassword(email, password)
    }
}
