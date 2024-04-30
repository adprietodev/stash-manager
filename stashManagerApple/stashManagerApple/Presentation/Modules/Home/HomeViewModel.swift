//
//  HomeViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    let usersUseCase: UsersUseCaseProtocol
    let roomsUseCase: RoomsUseCaseProtocol

    init(usersUseCase: UsersUseCaseProtocol, roomsUseCase: RoomsUseCaseProtocol) {
        self.usersUseCase = usersUseCase
        self.roomsUseCase = roomsUseCase
    }
}
