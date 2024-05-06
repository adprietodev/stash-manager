//
//  HomeProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 27/4/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var rooms: [ContentRoom] { get set}
    var typesRoom: [TypeRoom] { get set}
    var refreshCollectionView: (() -> Void)? { get set}
    func getTypesRoom()
    func goToRoomDetail(room: Room, typesRoom: [TypeRoom])
}

protocol HomeRouterProtocol {
    func goToRoomDetail(room: Room, typesRoom: [TypeRoom])
}
