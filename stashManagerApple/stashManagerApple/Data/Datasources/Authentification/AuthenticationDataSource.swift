//
//  AuthentificationDataSource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation
import Supabase

class AuthenticationDataSource: AuthenticationDatasourceProtocol {
    // MARK: - Properties
    let supabase = SupabaseConfig.shared.supabase

    // MARK: - Functions
    func signInWithEmailAndPassword(_ email: String, _ password: String) async throws -> Session {
        try await supabase.auth.signIn(email: email, password: password)
    }

    func signOutCurrentUser() async throws {
        try await supabase.auth.signOut()
    }
}
