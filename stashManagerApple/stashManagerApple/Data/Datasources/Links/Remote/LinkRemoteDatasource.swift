//
//  LinkDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

class LinkRemoteDatasource: LinksRemoteDatasourceProtocol {
    let supabase = SupabaseConfig.shared.supabase

    func getLinks(at roomID: Int) async throws -> [LinkDTO] {
        try await supabase.from("links").select().eq("idRoom", value: roomID).execute().value
    }

    func updateLink(_ link: LinkDTO) async throws {
        try await supabase.from("links").update(link).eq("id", value: link.id).execute()
    }

    func insertLink(_ link: LinkDTO) async throws {
        try await supabase.from("links").insert(link).execute()
    }
}
