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
    var roomUseCase: RoomsUseCaseProtocol
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

    func setCurrentType() {
        guard let type = typesRoom.filter({ $0.id == room?.idTypeRoom }).first?.name.rawValue else { return }
        currentType = type
    }

    func setTypeRoom(_ nameType: String) {
        typesRoom.forEach({
            if $0.name.rawValue.localized == nameType {
                room?.idTypeRoom = $0.id
            }
        })
    }

    func setNameRoom(_ nameRoom: String) {
        room?.name = nameRoom
    }

    func showCustomPickerType() {
        router.showCustomPickerType(typeScreen: .room, typeSelected: currentType, typeAction: typeAction, typeButtonPressed: .type)
    }

    func updateRoom() {
        Task {
            do {
                guard let room else { return }
                try await roomUseCase.updateRoom(room)
                try  roomUseCase.setSelectedRoom(room)
                router.finishEditOrAddRoom()
            }  catch {
                
            }
        }
    }

    func addRoom() {
        Task {
            do {
                guard let room else { return }
                try await roomUseCase.insertRoom(room)
                router.finishEditOrAddRoom()
            } catch {
                
            }
        }
    }

    func deleteRoom() {
        Task {
            do {
                guard let room else { return }
                try await roomUseCase.deleteRoom(room)
                router.deleteRoom()
            } catch {
                
            }
        }
    }
}
