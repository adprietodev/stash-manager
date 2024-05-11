//
//  StashesViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class StashesViewModel: StashesViewModelProtocol {
    
    // MARK: - Properties
    let roomsUseCase: RoomsUseCaseProtocol
    let stashesUseCase: StashesUseCaseProtocol
    let linksUseCase: LinkUseCaseProtocol
    let router: StashesRouterProtocol
    var selectedRoom: ContentRoom?
    var stashes = [Stash]()
    var typesStash = [TypeStash]()
    var contentsRoom = [ContentRoom]()
    var isSelectedRoom = false
    var refreshCollectionView: (() -> Void)?

    init(router: StashesRouterProtocol, roomsUseCase: RoomsUseCaseProtocol, stashesUseCase: StashesUseCaseProtocol, linksUseCase: LinkUseCaseProtocol) {
        self.roomsUseCase = roomsUseCase
        self.stashesUseCase = stashesUseCase
        self.linksUseCase = linksUseCase
        self.router = router
    }

    func getData() {
        isSelectedRoom = false
        Task {
            do {
                selectedRoom = nil
                contentsRoom = try linksUseCase.getLocalContentRooms() ?? []
                typesStash = try await stashesUseCase.getTypesStash()
                if let room = try roomsUseCase.getSelectedRoom() {
                    selectedRoom = contentsRoom.filter { $0.room.id == room.id }.first
                    stashes = selectedRoom!.stashes.map { $0.stash }
                    isSelectedRoom = true
                } else {
                    stashes = [Stash]()
                    for room in contentsRoom {
                        stashes += room.stashes.map { $0.stash }
                        let roomsAssigned = room.stashes.map { $0.stash.idRoom }
                    }
                }
                refreshCollectionView?()
            } catch {
            }
        }
    }

    func goToDetail(stash: Stash) {
        guard let room = selectedRoom?.room ?? contentsRoom.first(where: { $0.room.id == stash.idRoom ?? 0 })?.room else {return}
        router.goToDetail(room: room, stash: stash, typesStash: typesStash)
    }

    func checkSelectedStash() {
        do {
            if try stashesUseCase.getSelectedStash() == nil {
                roomsUseCase.removeSelectedRoom()
            }
        } catch {
            // TODO: - Error Control
        }
    }
}
