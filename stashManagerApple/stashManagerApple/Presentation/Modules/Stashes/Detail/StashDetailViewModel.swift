//
//  StashesDetailViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashDetailViewModel: StashDetailViewModelProtocol {
    // MARK: - Properties
    let roomsUseCase: RoomsUseCaseProtocol
    let stashesUseCase: StashesUseCaseProtocol
    var router: StashDetailRouter
    var stash: Stash
    var room: Room
    var typesStash: [TypeStash]
    var isGoingToArticle = false

    init(roomUseCase: RoomsUseCase, stashesUseCase: StashesUseCase, room: Room, router: StashDetailRouter, stash: Stash, typesStash: [TypeStash]) {
        self.router = router
        self.stash = stash
        self.typesStash = typesStash
        self.room = room
        self.roomsUseCase = roomUseCase
        self.stashesUseCase = stashesUseCase
    }

    // MARK: - Functions
    func goToEditStash() {
        router.goToEditStash(stash: stash, typesStash: typesStash, room: room)
    }

    func goToArticleInStash() {
        Task {
            do {
                isGoingToArticle = true
                try roomsUseCase.setSelectedRoom(room)
                try stashesUseCase.setSelectedStash(stash)
                router.goToArticleInStash()
            } catch {
                // TODO: - Error Control
            }
        }
    }

    func removeSelectedStash() {
        if !isGoingToArticle {
            stashesUseCase.removeSelectedStash()
        }
    }
}
