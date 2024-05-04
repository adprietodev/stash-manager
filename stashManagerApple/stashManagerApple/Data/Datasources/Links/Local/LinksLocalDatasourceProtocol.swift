//
//  LinksLocalDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation

protocol LinksLocalDatasourceProtocol {
    func getContentRoom() throws -> [ContentRoomDTO]?
    func setContentRoom(_ contentRoomDTO: [ContentRoomDTO]) throws
    func removeContentRoom()
}
