//
//  LinksDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import Foundation

protocol LinksRemoteDatasourceProtocol {
    func getLinksRoom(at roomID: Int) async throws -> [LinkDTO]
    func updateLink(_ link: LinkDTO) async throws
    func insertLink(_ link: LinkDTO, typeScreen: TypesScreens) async throws
    func getIdLinkToModify(roomID: Int, stashID: Int?, articleID: Int, typeScreen: TypesScreens) async throws -> [LinkDTO]
    func deleteLink(at linkID: Int) async throws
    func getLinksStash(at stashID: Int) async throws -> [LinkDTO]?
}
