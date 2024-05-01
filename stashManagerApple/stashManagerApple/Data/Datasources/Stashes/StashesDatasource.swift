//
//  StashesDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class StashesDatasource: StashesDatasourceProtocol {
    let supabase = SupabaseConfig.shared.supabase

    func getStashes() async throws -> [StashesDTO] {
        try await supabase.from("stashes").select().execute().value
    }

    func getTypesStash() async throws -> [TypeStashDTO] {
        try await supabase.from("types_stash").select().execute().value
    }
}
