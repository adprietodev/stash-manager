//
//  AuthenticationRepositoryProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation

protocol AuthenticationRepositoryProtocol {
    func signInWithEmailAndPassword(_ email: String, _ password: String) async throws -> Bool
}
