//
//  HomeDetailViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

class HomeDetailViewModel: HomeDetailViewModelProtocol {
    var router: HomeDetailRouterProtocol!
    var room: Room
    var typesRoom: [TypeRoom]

    init(router: HomeDetailRouterProtocol, room: Room, typesRoom: [TypeRoom]) {
        self.router = router
        self.room = room
        self.typesRoom = typesRoom
    }

    // MARK: - Functions
    func goToEditRoom() {
        router.goToEditRoom(room: self.room, typesRoom: self.typesRoom)
    }

    func goToStashesInRoom() {
    }
}
