//
//  ArticlesViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ArticlesViewModel: ArticlesViewModelProtocol {
    // MARK: - Properties
    let usersUseCase: UsersUseCase
    let roomsUseCase: RoomsUseCaseProtocol
    let stashesUseCase: StashesUseCaseProtocol
    let linksUseCase: LinkUseCaseProtocol
    let articleUseCase: ArticlesUseCaseProtocol
    var selectedRoom: ContentRoom!
    var selectedStash: ContentStash!
    var articlesWithStock = [ArticleWithStock]()
    var userArticles = [Article]()
    var isSelectedRoom: Bool = false
    var isSelectedStash: Bool = false
    var refreshCollectionView: (() -> Void)?

    init(usersUseCase: UsersUseCase, roomsUseCase: RoomsUseCaseProtocol, stashesUseCase: StashesUseCaseProtocol, linksUseCase: LinkUseCaseProtocol, articlesUseCase: ArticlesUseCaseProtocol) {
        self.usersUseCase = usersUseCase
        self.roomsUseCase = roomsUseCase
        self.stashesUseCase = stashesUseCase
        self.linksUseCase = linksUseCase
        self.articleUseCase = articlesUseCase
    }

    // MARK: - Funtions
    func getData() {
        Task {
            do {
                let contentsRoom = try linksUseCase.getLocalContentRooms()!
                if let room = try roomsUseCase.getSelectedRoom() {
                    isSelectedRoom = true
                    selectedRoom = contentsRoom.filter { $0.room.id == room.id }.first
                    articlesWithStock = selectedRoom.articles
                    if let stash = try stashesUseCase.getSelectedStash() {
                        isSelectedStash = true
                        selectedStash = selectedRoom.stashes.filter { $0.stash.id == stash.id }.first
                        articlesWithStock = selectedStash.articles
                    }
                } else {
                    let currentUser = try usersUseCase.getCurrentUser()
                    userArticles = try await articleUseCase.getArticles(at: currentUser.id)
                }
                refreshCollectionView?()
            } catch {
                // TODO: - Errors Controls
            }
        }
    }
}
