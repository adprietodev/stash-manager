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

    func getIdLinkToModify(roomID: Int, stashID: Int?, articleID: Int, typeScreen: TypesScreens) async throws -> [LinkDTO] {
        switch typeScreen {
        case .stash:
            guard let stashID else { return [] }
            return try await supabase.from("links").select().eq("idRoom", value: roomID).eq("idStash", value: stashID).execute().value
        case .article:
            if let stashID = stashID {
                return try await supabase.from("links").select().eq("idRoom", value: roomID).eq("idStash", value: stashID).eq("idArticle", value: articleID).execute().value
            } else {
                return try await supabase.from("links").select().eq("idRoom", value: roomID).is("idStash", value: "null").eq("idArticle", value: articleID).execute().value
            }
        default:
            return []
        }
    }

    func updateLink(_ link: LinkDTO) async throws {
        try await supabase.from("links").update(link).eq("id", value: link.id).execute()
    }

    func insertLink(_ link: LinkDTO) async throws {
        try await supabase.from("links").insert(link).execute()
    }
}
