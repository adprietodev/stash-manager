//
//  AuthenticationRepositoryProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation
import Supabase

protocol AuthenticationRepositoryProtocol {
    func signInWithEmailAndPassword(_ email: String, _ password: String) async throws -> Session
    func signOutCurrentUser() async throws
    func deleteUserAuth(_ UUID: String) async throws
}
