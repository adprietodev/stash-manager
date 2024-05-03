//
//  RoomsLocalDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation

class RoomsLocalDatasource: RoomsLocalDatasourceProtocol {
    // MARK: - Functions
    func getSelectedRoom() throws -> RoomDTO? {
        if let data = UserDefaults.standard.data(forKey: "selectedRoom") {
            let decoder = JSONDecoder()
            return try decoder.decode(RoomDTO.self, from: data)
        }
        return nil
    }

    func setSelectedRoom(_ roomDTO: RoomDTO) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(roomDTO)
        UserDefaults.standard.set(data, forKey: "selectedRoom")
    }

    func removeSelectedRoom() {
        UserDefaults.standard.removeObject(forKey: "selectedRoom")
    }
}
