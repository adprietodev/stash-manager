//
//  RoomsDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation
import Supabase

class RoomsRemoteDatasource: RoomsRemoteDatasourceProtocol {
    // MARK: - Properties
    let supabase = SupabaseConfig.shared.supabase

    // MARK: - Functions
    func getRooms(at userID: Int) async throws -> [RoomDTO] {
        try await supabase.from("rooms").select().eq("idUser", value: userID).execute().value
    }

    func getTypesRoom() async throws -> [TypesRoomDTO] {
        try await supabase.from("types_room").select().execute().value
    }

    func updateRoom(_ room: RoomDTO) async throws {
        try await supabase.from("rooms").update(room).eq("id", value: room.id).execute()
    }

    func insertRoom(_ room: RoomDTO) async throws {
        let newRoom = NewRoomDTO(name: room.name, base64image: room.base64image, description: room.description, idTypeRoom: room.idTypeRoom, idUser: room.idUser)
        try await supabase.from("rooms").insert(newRoom).execute()
    }

    func deleteRoom(_ room: RoomDTO) async throws {
        try await supabase.from("rooms").delete().eq("id", value: room.id).execute()
    }
}
