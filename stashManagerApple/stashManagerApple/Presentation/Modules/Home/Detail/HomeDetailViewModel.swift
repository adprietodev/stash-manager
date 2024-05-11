//
//  HomeDetailViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

class HomeDetailViewModel: HomeDetailViewModelProtocol {
    var router: HomeDetailRouterProtocol
    var roomsUseCase: RoomsUseCaseProtocol
    var room: Room
    var typesRoom: [TypeRoom]

    init(router: HomeDetailRouterProtocol, roomsUseCase: RoomsUseCase, room: Room, typesRoom: [TypeRoom]) {
        self.router = router
        self.room = room
        self.typesRoom = typesRoom
        self.roomsUseCase = roomsUseCase
    }

    // MARK: - Functions
    func goToEditRoom() {
        router.goToEditRoom(room: self.room, typesRoom: self.typesRoom)
    }

    func goToStashesRoom() {
        do {
            try roomsUseCase.setSelectedRoom(room)
            router.goToStashesRoom()
        } catch {
            // TODO: - Error Control
        }
    }

    func goToArticlesInRoom() {
        do {
            try roomsUseCase.setSelectedRoom(room)
            router.goToArticlesInRoom()
        } catch {
        }
    }
}
