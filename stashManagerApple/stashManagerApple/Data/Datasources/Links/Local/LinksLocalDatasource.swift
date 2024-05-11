//
//  LinksLocalDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation

class LinksLocalDatasource: LinksLocalDatasourceProtocol {
    // MARK: - Functions
    func getContentRoom() throws -> [ContentRoomDTO]? {
        if let data = UserDefaults.standard.data(forKey: "contentRoom") {
            let decoder = JSONDecoder()
            return try decoder.decode([ContentRoomDTO].self, from: data)
        }
        return nil
    }

    func setContentRoom(_ contentRoomDTO: [ContentRoomDTO]) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(contentRoomDTO)

        UserDefaults.standard.set(data, forKey: "contentRoom")
    }

    func removeContentRoom() {
        UserDefaults.standard.removeObject(forKey: "contentRoom")
    }
}
