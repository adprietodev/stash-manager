//
//  RoomsDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation
import Supabase

class RoomsDatasource: RoomsDatasourceProtocol {
    // MARK: - Properties
    let supabase = SupabaseConfig.shared.supabase

    // MARK: - Functions
    func getRooms(at userID: Int) async throws -> [RoomDTO] {
        try await supabase.from("rooms").select().eq("idUser", value: userID).execute().value
    }

    func getTypesRoom() async throws -> [TypesRoomDTO] {
        try await supabase.from("types_room").select().execute().value
    }
}
