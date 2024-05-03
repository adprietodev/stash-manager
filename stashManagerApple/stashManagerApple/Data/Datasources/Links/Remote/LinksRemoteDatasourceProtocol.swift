//
//  LinksDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

protocol LinksRemoteDatasourceProtocol {
    func getLinks(at roomID: Int) async throws -> [LinkDTO]
}
