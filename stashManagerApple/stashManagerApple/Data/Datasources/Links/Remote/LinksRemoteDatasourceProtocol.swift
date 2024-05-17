//
//  LinksDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

protocol LinksRemoteDatasourceProtocol {
    func getLinks(at roomID: Int) async throws -> [LinkDTO]
    func updateLink(_ link: LinkDTO) async throws
    func insertLink(_ link: LinkDTO) async throws 
    func getIdLinkToModify(roomID: Int, stashID: Int?, articleID: Int, typeScreen: TypesScreens) async throws -> [LinkDTO]
}
