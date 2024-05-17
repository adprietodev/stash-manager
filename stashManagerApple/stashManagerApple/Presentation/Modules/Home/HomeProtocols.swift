//
//  HomeProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 27/4/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var contentrooms: [ContentRoom] { get set}
    var typesRoom: [TypeRoom] { get set}
    var refreshCollectionView: (() -> Void)? { get set}
    var rooms: [Room] { get set }
    var filteredRooms: [Room] { get set }
    var isFiltering: Bool { get set }
    func getRoomsAndTypesRoom()
    func goToRoomDetail(room: Room)
    func removeSelectedRoom()
    func isFilterRoom(by name: String) -> Bool
    func goToAddRoom()
}

protocol HomeRouterProtocol {
    func goToRoomDetail(room: Room, typesRoom: [TypeRoom])
    func goToAddRoom(room: Room, typesRoom: [TypeRoom], typeAction: TypeAction)
}
