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
    var typeAction: TypeAction
    var typeButtonPressed: TypeButtonPressed?

    init(router: HomeEditRouterProtocol, roomUseCase: RoomsUseCaseProtocol, room: Room, typesRoom: [TypeRoom], typeAction: TypeAction) {
        self.router = router
        self.roomUseCase = roomUseCase
        self.room = room
        self.typesRoom = typesRoom
        self.typeAction = typeAction
    }

    init(router: HomeEditRouterProtocol, typesRoom: [TypeRoom], typeAction: TypeAction) {
        self.router = router
        self.room = nil
        self.typesRoom = typesRoom
        self.typeAction = typeAction
    }

    func setCurrentType() {
        guard let type = typesRoom.filter({ $0.id == room?.idTypeRoom }).first?.name.rawValue else { return }
        currentType = type
    }

    func showCustomPickerType() {
        router.showCustomPickerType(typeScreen: .room, typeSelected: currentType, typeAction: typeAction, typeButtonPressed: .type)
    }
}
