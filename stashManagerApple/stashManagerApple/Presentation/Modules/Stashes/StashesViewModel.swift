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
    var filteredStashes = [Stash]()
    var typesStash = [TypeStash]()
    var contentsRoom = [ContentRoom]()
    var isSelectedRoom = false
    var isFiltering: Bool = false
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
                if typesStash.isEmpty {
                    typesStash = try await stashesUseCase.getTypesStash()
                }
                if let room = try roomsUseCase.getSelectedRoom() {
                    guard let selectedRoom = contentsRoom.filter { $0.room.id == room.id }.first else { return }
                    stashes = selectedRoom.stashes.map { $0.stash }
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

    func isFilterStashes(by name: String) -> Bool {
        if !name.isEmpty {
            filteredStashes = stashes.filter { $0.name.lowercased().contains(name.lowercased()) }
            return true
        } else {
            return false
        }
    }

    func goToDetail(stash: Stash) {
        guard let room = selectedRoom?.room ?? contentsRoom.first(where: { $0.room.id == stash.idRoom ?? 0 })?.room else {return}
        router.goToDetail(room: room, stash: stash, typesStash: typesStash)
    }

    func goToAddStash() {
        if selectedRoom == nil {
            selectedRoom = ContentRoom(room: Room(id: 0, name: "", base64image: "", description: "", idTypeRoom: 0, idUser: 0), stashes: [], articles: [])
        }
        router.goToAddStash(stash: Stash(id: 0, name: "", description: "", base64image: "", idTypeStash: 0, idRoom: 0), typesStash: typesStash, typeAction: .add, room: selectedRoom!.room)
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
