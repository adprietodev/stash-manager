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
        let updateStash = NewStashDTO(name: stash.name, description: stash.description, base64image: stash.base64image, idTypeStash: stash.idTypeStash)
        try await supabase.from("stashes").update(updateStash).eq("id", value: stash.id).execute()
    }

    func insertStash(_ stash: StashDTO) async throws -> Int {
        let newStash = NewStashDTO(name: stash.name, description: stash.description, base64image: stash.base64image, idTypeStash: stash.idTypeStash)
        try await supabase.from("stashes").insert(newStash).execute()
        let stashDTO: [StashDTO] = try await supabase.from("stashes").select().execute().value
        guard let idLastStash = stashDTO.last?.id else { return 0}
        return idLastStash
    }

    func deleteStash(_ stash: StashDTO) async throws {
        try await supabase.from("stashes").delete().eq("id", value: stash.id).execute()
    }
}
