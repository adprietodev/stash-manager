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
    var selectedRoom: ContentRoom!
    var stashes = [Stash]()
    var typesStash = [TypeStash]()
    var contentsRoom = [ContentRoom]()
    var isSelectedRoom = false
    var refreshCollectionView: (() -> Void)?

    init(roomsUseCase: RoomsUseCaseProtocol, stashesUseCase: StashesUseCaseProtocol, linksUseCase: LinkUseCaseProtocol) {
        self.roomsUseCase = roomsUseCase
        self.stashesUseCase = stashesUseCase
        self.linksUseCase = linksUseCase
    }

    func getData() {
        Task {
            do {
                contentsRoom = try linksUseCase.getLocalContentRooms()!
                typesStash = try await stashesUseCase.getTypesStash()
                if let room = try roomsUseCase.getSelectedRoom() {
                    selectedRoom = contentsRoom.filter { $0.room.id == room.id }.first
                    isSelectedRoom = true
                } else {
                    stashes = try await stashesUseCase.getStashes()
                }
                refreshCollectionView?()
            } catch {
            }
        }
    }
}
