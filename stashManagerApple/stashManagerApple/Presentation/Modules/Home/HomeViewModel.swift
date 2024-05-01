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
    var rooms = [ContentRoom]()
    var typesRoom = [TypeRoom]()
    var refreshCollectionView: (() -> Void)?

    init(usersUseCase: UsersUseCaseProtocol, roomsUseCase: RoomsUseCaseProtocol) {
        self.usersUseCase = usersUseCase
        self.roomsUseCase = roomsUseCase
    }

    func getTypesRoom() {
        Task {
            typesRoom = try await roomsUseCase.getTypesRoom()
            refreshCollectionView?()
        }
    }
}
