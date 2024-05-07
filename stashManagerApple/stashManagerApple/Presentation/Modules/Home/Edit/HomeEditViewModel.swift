//
//  HomeEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 7/5/24.
//

import Foundation

class HomeEditViewModel: HomeEditViewModelProtocol {
    // MARK: - Properties
    var router: HomeEditRouterProtocol!
    var roomUseCase: RoomsUseCaseProtocol!
    var room: Room?
    var typesRoom: [TypeRoom]?

    init(router: HomeEditRouterProtocol, roomUseCase: RoomsUseCaseProtocol, room: Room, typesRoom: [TypeRoom]) {
        self.router = router
        self.roomUseCase = roomUseCase
        self.room = room
        self.typesRoom = typesRoom
    }
}
