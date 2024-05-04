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
    let linksUseCase: LinkUseCaseProtocol
    var currentUser: User!
    var rooms = [ContentRoom]()
    var typesRoom = [TypeRoom]()
    var refreshCollectionView: (() -> Void)?

    init(usersUseCase: UsersUseCaseProtocol, roomsUseCase: RoomsUseCaseProtocol, linksUseCase: LinkUseCaseProtocol) {
        self.usersUseCase = usersUseCase
        self.roomsUseCase = roomsUseCase
        self.linksUseCase = linksUseCase
    }

    func getTypesRoom() {
        Task {
            typesRoom = try await roomsUseCase.getTypesRoom()
            guard let contentRooms = try linksUseCase.getLocalContentRooms() else { return }
            rooms = contentRooms
            currentUser = try usersUseCase.getCurrentUser()
            refreshCollectionView?()
        }
    }
}
