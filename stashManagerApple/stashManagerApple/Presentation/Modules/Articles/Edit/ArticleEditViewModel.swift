//
//  ArticleEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleEditViewModel: ArticleEditViewModelProtocol {
    let linksUseCase: LinkUseCaseProtocol
    var article: Article
    var typesArticle: [TypeArticle]
    var currentType: String = ""
    let router:  ArticleEditRouterProtocol
    var typeAction: TypeAction
    var typeButtonPressed: TypeButtonPressed?
    var selectedRoom: Room
    var selectedStash: Stash

    init(router: ArticleEditRouterProtocol, linksUseCase: LinkUseCaseProtocol, article: Article, typesArticle: [TypeArticle], typeAction: TypeAction, selectedRoom: ContentRoom, selectedStash: ContentStash) {
        self.linksUseCase = linksUseCase
        self.router = router
        self.article = article
        self.typesArticle = typesArticle
        self.typeAction = typeAction
        self.selectedRoom = selectedRoom.room
        self.selectedStash = selectedStash.stash
    }

    func setCurrentType() {
        guard let type = typesArticle.filter({ $0.id == article.idTypeArticle }).first?.name.rawValue else { return }
        currentType = type
    }

    func showCustomPickerType() {
        router.showCustomPickerType(typeScreen: .article, typeSelected: currentType, typeAction: typeAction, typeButtonPressed: .type)
    }

    func showCustomPickerRoom() {
        Task {
            do {
                let contentRooms = try self.linksUseCase.getLocalContentRooms()
                guard let rooms = contentRooms?.compactMap({ $0.room }) else { return }
                router.showCustomPickerRoom(typeScreen: .article, typeAction: typeAction, rooms: rooms, typeButtonPressed: .room, roomSelectedName: selectedRoom.name)
            } catch {
                // TODO: - Control Error
            }
        }
    }

    func showCustomPickerStash() {
        Task {
            do {
                guard let contentRooms = try self.linksUseCase.getLocalContentRooms() else { return }
                var stashes = [Stash]()
                for contentRoom in contentRooms {
                    let stash = contentRoom.stashes.compactMap { $0.stash }
                    stashes.append(contentsOf: stash)
                }
                router.showCustomPickerStash(typeScreen: .article, typeAction: typeAction, stashes: stashes, typeButtonPressed: .stash, stashSelectedName: selectedStash.name)
            } catch {
                // TODO: - Control Error
            }
        }
    }
}
