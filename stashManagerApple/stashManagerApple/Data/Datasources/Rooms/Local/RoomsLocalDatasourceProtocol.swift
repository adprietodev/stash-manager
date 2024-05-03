//
//  RoomsLocalDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation

protocol RoomsLocalDatasourceProtocol {
    func getSelectedRoom() throws -> RoomDTO?
    func setSelectedRoom(_ roomDTO: RoomDTO) throws
    func removeSelectedRoom()
}
