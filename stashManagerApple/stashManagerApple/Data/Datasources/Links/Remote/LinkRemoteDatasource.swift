//
//  LinkDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

class LinkDatasource: LinksRemoteDatasourceProtocol {
    let supabase = SupabaseConfig.shared.supabase

    func getLinks(at roomID: Int) async throws -> [LinkDTO] {
        try await supabase.from("links").select().eq("idRoom", value: roomID).execute().value
    }
}
