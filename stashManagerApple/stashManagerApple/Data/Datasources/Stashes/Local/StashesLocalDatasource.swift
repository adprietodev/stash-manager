//
//  StashesLocalDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation

class StashesLocalDatasource: StashesLocalDatasourceProtocol {
    // MARK: - Functions
    func getSelectedStash() throws -> StashDTO? {
        if let data = UserDefaults.standard.data(forKey: "selectedStash") {
            let decoder = JSONDecoder()
            return try decoder.decode(StashDTO.self, from: data)
        }
        return nil
    }

    func setSelectedStash(_ stashDTO: StashDTO) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(stashDTO)
        UserDefaults.standard.set(data, forKey: "selectedStash")
    }

    func removeSelectedStash() {
        UserDefaults.standard.removeObject(forKey: "selectedStash")
    }
}
