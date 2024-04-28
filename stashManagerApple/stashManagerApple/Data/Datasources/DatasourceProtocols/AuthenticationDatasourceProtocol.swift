//
//  AuthenticationDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation

protocol AuthenticationDatasourceProtocol{
    func signInWithEmailAndPassword(_ email: String, _ password: String) async throws -> Bool
}
