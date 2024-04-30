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
    
    func getUser(at authIDUser: UUID) async throws -> UserDTO {
        try await supabase.from("users").select().eq("id_authUser", value: authIDUser).execute().value
    }
}
