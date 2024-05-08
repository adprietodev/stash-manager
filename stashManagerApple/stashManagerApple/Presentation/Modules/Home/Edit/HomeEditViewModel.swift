//
//  HomeEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 7/5/24.
//

import Foundation

class HomeEditViewModel: HomeEditViewModelProtocol {
    // MARK: - Properties
    var roomUseCase: RoomsUseCaseProtocol!
    var room: Room?
    var typesRoom: [TypeRoom]?

    init(roomUseCase: RoomsUseCaseProtocol, room: Room, typesRoom: [TypeRoom]) {
        self.roomUseCase = roomUseCase
        self.room = room
        self.typesRoom = typesRoom
    }
}
