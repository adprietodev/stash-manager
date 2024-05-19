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
    var roomsUseCase: RoomsUseCaseProtocol
    var stashesUseCase: StashesUseCaseProtocol
    var userUseCase: UsersUseCaseProtocol
    var articleUseCase: ArticlesUseCase
    var stash: Stash
    var typesStash: [TypeStash]
    var router: StashEditRouterProtocol
    var currentType: String = TypesStash.cabinet.rawValue
    var typeAction: TypeAction
    var room: Room
    var rooms = [Room]()
    var typeButtonPressed: TypeButtonPressed?

    init(router: StashEditRouterProtocol, linksUseCase: LinkUseCaseProtocol, roomsUseCase: RoomsUseCaseProtocol, stashesUseCase: StashesUseCase, userUseCase: UsersUseCaseProtocol, articleUseCase: ArticlesUseCase, stash: Stash, typesStash: [TypeStash], typeAction:  TypeAction, room: Room) {
        self.stash = stash
        self.typesStash = typesStash
        self.router = router
        self.typeAction = typeAction
        self.room =  room
        self.linksUseCase = linksUseCase
        self.roomsUseCase = roomsUseCase
        self.stashesUseCase = stashesUseCase
        self.userUseCase = userUseCase
        self.articleUseCase = articleUseCase
        self.getRooms()
    }

    func setCurrentType() {
        guard let type = typesStash.filter({ $0.id == stash.idTypeStash }).first?.name.rawValue else { return }
        currentType = type
    }

    func getRooms() {
        Task {
            do {
                let currentUser = try userUseCase.getCurrentUser()
                rooms = try await roomsUseCase.getRooms(at: currentUser.id)
            } catch {
                
            }
        }
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

    func setTypeStash(_ nameType: String) {
        typesStash.forEach( {
            if $0.name.rawValue.localized == nameType {
                stash.idTypeStash = $0.id
            }
        })
    }

    func setNameStash(_ nameStash: String) {
        stash.name = nameStash
    }

    func setRoom(_ nameRoom: String) {
        rooms.forEach {
            if $0.name == nameRoom {
                room = $0
            }
        }
    }

    func updateStash() {
        Task {
            do {
                try stashesUseCase.setSelectedStash(stash)
                try await stashesUseCase.updateStash(stash)
                try stashesUseCase.setSelectedStash(stash)
                try await updateLocalContentRoom()
                router.finisUpdateStash()
            } catch {
            }
        }
    }

    func insertStash() {
        Task {
            do {
                let lastID = try await stashesUseCase.insertStash(stash)
                try await linksUseCase.insertLink(Link(id: 0, idRoom: room.id, idStash: lastID, idArticle: nil, stockArticle: nil), typeScreen: .stash)
                try await updateLocalContentRoom()
                router.finishToInserOrDeletetStash()
            } catch {
            }
        }
    }

    func updateLocalContentRoom() async throws {
        let currentUser = try self.userUseCase.getCurrentUser()
        let roomsUser = try await roomsUseCase.getRooms(at: currentUser.id)
        let stashes = try await stashesUseCase.getStashes()
        let articlesUser = try await articleUseCase.getArticles(at: currentUser.id)
        let roomsIDs = roomsUser.map { $0.id }
        _ = try await linksUseCase.getContentRooms(with: roomsIDs, of: roomsUser, of: stashes, at: articlesUser)
    }

    func deleteStash() {
        Task {
            do {
                var links = try await linksUseCase.getIdLinkToModify(roomID: room.id, stashID: stash.id, articleID: 0, typeScreen: .stash)
                await withThrowingTaskGroup(of: Void.self) { group in
                    for link in links {
                        group.addTask {
                            if link.idArticle == nil, link.stockArticle == nil {
                                try await self.linksUseCase.deleteLink(at: link.id)
                            } else {
                                let updateLink = Link(id: link.id, idRoom: link.idRoom, idStash: nil, idArticle: link.idArticle, stockArticle: link.stockArticle)
                                try await self.linksUseCase.updateLink(updateLink, typeScreens: .stash)
                            }
                        }
                    }
                    do {
                        try await group.waitForAll()
                    } catch {
                    }
                }
                links = try await linksUseCase.getLinksStash(at: stash.id)
                if links.isEmpty {
                    try await stashesUseCase.deleteStash(stash)
                }
                try await updateLocalContentRoom()
                router.finishToInserOrDeletetStash()
            } catch {
            }
        }
    }
}
