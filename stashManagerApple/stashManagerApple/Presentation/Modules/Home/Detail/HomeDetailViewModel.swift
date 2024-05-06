//
//  HomeDetailViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

class HomeDetailViewModel: HomeDetailViewModelProtocol {
    var room: Room
    var typesRoom: [TypeRoom]

    init(room: Room, typesRoom: [TypeRoom]) {
        self.room = room
        self.typesRoom = typesRoom
    }
}
