//
//  LinksDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

protocol LinksDatasourceProtocol {
    func getLinks(at roomID: Int) async throws -> [LinkDTO]
}
