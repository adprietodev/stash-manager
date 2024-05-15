//
//  StashEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashEditViewModel: StashEditViewModelProtocol {
    // MARK: - Properties
    var linksUseCase: LinkUseCaseProtocol
    var stash: Stash
    var typesStash: [TypeStash]
    var router: StashEditRouterProtocol
    var currentType: String = TypesStash.cabinet.rawValue
    var typeAction: TypeAction
    var room: Room
    var typeButtonPressed: TypeButtonPressed?

    init(router: StashEditRouterProtocol, linksUseCase: LinkUseCaseProtocol, stash: Stash, typesStash: [TypeStash], typeAction:  TypeAction, room: Room) {
        self.stash = stash
        self.typesStash = typesStash
        self.router = router
        self.typeAction = typeAction
        self.room =  room
        self.linksUseCase = linksUseCase
    }

    func setCurrentType() {
        guard let type = typesStash.filter({ $0.id == stash.idTypeStash }).first?.name.rawValue else { return }
        currentType = type
    }

    func showCustomPickerType() {
        router.showCustomPickerType(typeScreen: .stash, typeSelected: currentType ,typeAction: typeAction, typeButtonPressed: .type)
    }

    func showCustomPickerRoom() {
        Task {
            do {
                guard let contentRooms = try self.linksUseCase.getLocalContentRooms() else { return }
                let rooms = contentRooms.compactMap { $0.room }
                guard let typeButtonPressed else { return }
                router.showCustomPickerRoom(typeScreen: .stash, typeAction: typeAction, rooms: rooms, typeButtonPressed: typeButtonPressed, roomSelectedName: room.name)
            } catch {
                // TODO: - Control error
            }
        }
    }
}
