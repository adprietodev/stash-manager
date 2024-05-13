//
//  HomeEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 7/5/24.
//

import Foundation

class HomeEditViewModel: HomeEditViewModelProtocol {
    // MARK: - Properties
    let router: HomeEditRouterProtocol
    var roomUseCase: RoomsUseCaseProtocol!
    var room: Room?
    var typesRoom: [TypeRoom]
    var currentType: String = ""
    var typeScreen: TypeAction

    init(router: HomeEditRouterProtocol, roomUseCase: RoomsUseCaseProtocol, room: Room, typesRoom: [TypeRoom], typeScreen: TypeAction) {
        self.router = router
        self.roomUseCase = roomUseCase
        self.room = room
        self.typesRoom = typesRoom
        self.typeScreen = typeScreen
    }

    init(router: HomeEditRouterProtocol, typesRoom: [TypeRoom], typeScreen: TypeAction) {
        self.router = router
        self.room = nil
        self.typesRoom = typesRoom
        self.typeScreen = typeScreen
    }

    func setCurrentType() {
        guard let type = typesRoom.filter({ $0.id == room?.idTypeRoom }).first?.name.rawValue else { return }
        print(currentType)
        currentType = type
    }

    func showCustomPickerType() {
        router.showCustomPickerType(typeScreen: .room, typeSelected: currentType)
    }
}
