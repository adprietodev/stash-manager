//
//  LinkUseCaseProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 1/5/24.
//

import Foundation

protocol LinkUseCaseProtocol {
    func getContentRooms(with roomIDs: [Int], of rooms: [Room], of stashes: [Stash], at articles: [Article]) async throws -> [ContentRoom]
    func setContentRooms(_ contentRoom: [ContentRoom]) throws
    func removeContentRooms()
    func getLocalContentRooms() throws -> [ContentRoom]?
    func getIdLinkToModify(roomID: Int, stashID: Int, articleID: Int, typeScreen: TypesScreens) async throws -> [Link]
    func updateLink(_ link: Link, typeScreens: TypesScreens) async throws
    func insertLink(_ link: Link, typeScreen: TypesScreens) async throws
    func deleteLink(at linkID: Int) async throws
    func getLinksStash(at stashID: Int) async throws -> [Link]
}
