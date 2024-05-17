//
//  UsersDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation
import Supabase

class UsersRemoteDatasource: UsersRemoteDatasourceProtocol {
    let supabase = SupabaseConfig.shared.supabase
    func getUser(at authIDUser: UUID) async throws -> [UserDTO] {
        try await supabase.from("users").select().eq("id_authUser", value: authIDUser).execute().value
    }

    func updateUser(_ user: UserDTO) async throws {
        try await supabase.from("users").update(user).eq("id", value: user.id).execute()
    }

    func insertUser(_ user: UserDTO) async throws {
        try await supabase.from("users").insert(user).execute()
    }

    func deleteUser(_ user: UserDTO) async throws {
        try await supabase.from("users").delete().eq("id", value: user.id).execute()
    }
}
