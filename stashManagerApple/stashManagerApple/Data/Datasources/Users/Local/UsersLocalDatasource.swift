//
//  UserLocalDatasource.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 30/4/24.
//

import Foundation

class UsersLocalDatasource: UsersLocalDatasourceProtocol {
    // MARK: - Functions
    func getLocalCurrentUser() throws -> UserDTO? {
        if let data = UserDefaults.standard.data(forKey: "currentUser") {
            let decoder = JSONDecoder()
            return try decoder.decode(UserDTO.self, from: data)
        }
        return nil
    }

    func setLocalCurrentUser(_ userDTO: UserDTO) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(userDTO)
        UserDefaults.standard.set(data, forKey: "currentUser")
    }

    func removeLocalCurrentUser() {
        UserDefaults.standard.removeObject(forKey: "currentUser")
    }
}
