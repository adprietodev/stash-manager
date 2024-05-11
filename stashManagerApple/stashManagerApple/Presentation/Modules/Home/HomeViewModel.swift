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
    let router: HomeRouterProtocol
    var currentUser: User!
    var contentrooms = [ContentRoom]()
    var rooms = [Room]()
    var filteredRooms = [Room]()
    var isFiltering: Bool = false
    var typesRoom = [TypeRoom]()
    var refreshCollectionView: (() -> Void)?

    init(router: HomeRouterProtocol, usersUseCase: UsersUseCaseProtocol, roomsUseCase: RoomsUseCaseProtocol, linksUseCase: LinkUseCaseProtocol) {
        self.usersUseCase = usersUseCase
        self.roomsUseCase = roomsUseCase
        self.linksUseCase = linksUseCase
        self.router = router
    }

    func getRoomsAndTypesRoom() {
        Task {
            typesRoom = try await roomsUseCase.getTypesRoom()
            guard let contentRooms = try linksUseCase.getLocalContentRooms() else { return }
            contentrooms = contentRooms
            rooms = contentrooms.map { $0.room }
            currentUser = try usersUseCase.getCurrentUser()
            refreshCollectionView?()
        }
    }

    func isFilterRoom(by name: String) -> Bool {
        if name.isEmpty {
            rooms = contentrooms.map { $0.room }
            return false
        } else {
            filteredRooms = rooms.filter { $0.name.lowercased().contains(name.lowercased()) }
            return true
        }
    }

    func goToRoomDetail(room: Room) {
        router.goToRoomDetail(room: room, typesRoom: typesRoom)
    }

    func removeSelectedRoom() {
        roomsUseCase.removeSelectedRoom()
    }
}
