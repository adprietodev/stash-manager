//
//  UsersLocalDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 30/4/24.
//

import Foundation

protocol UsersLocalDatasourceProtocol {
    func getLocalCurrentUser() throws -> UserDTO?
    func setLocalCurrentUser(_ userDTO: UserDTO) throws
    func removeLocalCurrentUser()
}
