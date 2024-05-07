//
//  LinksRepositoryProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 1/5/24.
//

import Foundation

protocol LinksRepositoryProtocol {
    func getRemoteLink(at roomID: Int) async throws -> [Link]?
    func getContentRoom() throws -> [ContentRoom]?
    func setContentRoom(_ contentRoom: [ContentRoom]) throws
    func removeContentRoom()
}