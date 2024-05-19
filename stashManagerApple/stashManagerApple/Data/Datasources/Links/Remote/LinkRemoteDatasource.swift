//
//  LinkDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

class LinkRemoteDatasource: LinksRemoteDatasourceProtocol {
    let supabase = SupabaseConfig.shared.supabase

    func getLinksRoom(at roomID: Int) async throws -> [LinkDTO] {
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

    func getLinksStash(at stashID: Int) async throws -> [LinkDTO]? {
        try await supabase.from("links").select().eq("idStash", value: stashID).execute().value
    }

    func updateLink(_ link: LinkDTO) async throws {
        try await supabase.from("links").update(link).eq("id", value: link.id).execute()
    }

    func insertLink(_ link: LinkDTO, typeScreen: TypesScreens) async throws {
        print(link)
        var newLink = NewLinkDTO(id: nil, idRoom: nil, idStash: nil, idArticle: nil, stockArticle: nil)
        switch typeScreen {
        case .stash:
            if link.idArticle == nil, link.stockArticle == nil {
                newLink = NewLinkDTO(idRoom: link.idRoom, idStash: link.idStash)
            } else {
                newLink = NewLinkDTO(idRoom: link.idRoom, idStash: link.idStash, idArticle: link.idArticle, stockArticle: link.stockArticle)
            }
        case .article:
            newLink = NewLinkDTO(idRoom: link.idRoom, idStash: link.idStash, idArticle: link.idArticle, stockArticle: link.stockArticle)
        default:
            break
        }
        try await supabase.from("links").insert(newLink).execute()
    }

    func deleteLink(at linkID: Int) async throws {
        try await supabase.from("links").delete().eq("id", value: linkID).execute()
    }
}
