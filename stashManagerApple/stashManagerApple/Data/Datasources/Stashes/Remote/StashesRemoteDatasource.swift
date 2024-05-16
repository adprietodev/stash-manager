//
//  StashesDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class StashesRemoteDatasource: StashesRemoteDatasourceProtocol {
    let supabase = SupabaseConfig.shared.supabase

    func getStashes() async throws -> [StashDTO] {
        try await supabase.from("stashes").select().execute().value
    }

    func getTypesStash() async throws -> [TypeStashDTO] {
        try await supabase.from("types_stash").select().execute().value
    }

    func updateStash(_ stash: StashDTO) async throws {
        try await supabase.from("stashes").update(stash).eq("id", value: stash.id).execute()
    }

    func insertStash(_ stash: StashDTO) async throws {
        try await supabase.from("stashes").insert(stash).execute()
    }
}
