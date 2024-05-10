//
//  HomeDetailProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

protocol HomeDetailViewModelProtocol {
    var room: Room { get set }
    var typesRoom: [TypeRoom] { get set }
    func goToEditRoom()
    func goToStashesRoom()
    func goToArticlesInRoom() 
}

protocol HomeDetailRouterProtocol {
    func goToEditRoom(room: Room, typesRoom: [TypeRoom])
    func goToStashesRoom()
    func goToArticlesInRoom()
}
