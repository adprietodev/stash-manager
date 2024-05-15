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
    let router: ArticlesRouterProtocol
    var contentsRoom: [ContentRoom]!
    var selectedRoom: ContentRoom!
    var selectedStash: ContentStash!
    var articlesWithStock = [ArticleWithStock]()
    var userArticles = [Article]()
    var typesArticle: [TypeArticle]!
    var isSelectedRoom: Bool = false
    var isSelectedStash: Bool = false
    var showAllArticles: Bool = false
    var goingIntoDetailOrEdit: Bool = false
    var refreshCollectionView: (() -> Void)?
    var currentSegmentSelected: Int = 0
    var filteredArticles = [Article]()
    var filteredArticlesWithStock = [ArticleWithStock]()
    var isFiltering: Bool = false
    var articleVoid: Article = Article(id: 0, name: "", base64image: "", description: "", idUser: 0, idTypeArticle: 0)

    init(router: ArticlesRouterProtocol, usersUseCase: UsersUseCase, roomsUseCase: RoomsUseCaseProtocol, stashesUseCase: StashesUseCaseProtocol, linksUseCase: LinkUseCaseProtocol, articlesUseCase: ArticlesUseCaseProtocol) {
        self.usersUseCase = usersUseCase
        self.roomsUseCase = roomsUseCase
        self.stashesUseCase = stashesUseCase
        self.linksUseCase = linksUseCase
        self.articleUseCase = articlesUseCase
        self.router = router
    }

    // MARK: - Funtions
    func getData() {
        Task {
            do {
                contentsRoom = try linksUseCase.getLocalContentRooms()!
                if showAllArticles {
                    let currentUser = try usersUseCase.getCurrentUser()
                    userArticles = try await articleUseCase.getArticles(at: currentUser.id)
                } else {
                    isSelectedRoom = false
                    isSelectedStash = false
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
                        showAllArticles = true
                        let currentUser = try usersUseCase.getCurrentUser()
                        userArticles = try await articleUseCase.getArticles(at: currentUser.id)
                    }
                }
                typesArticle = try await articleUseCase.getTypesArticle()
                refreshCollectionView?()
            } catch {
                // TODO: - Errors Controls
            }
        }
    }

    func isFilterArticle(by name: String) -> Bool {
        if !name.isEmpty {
            if showAllArticles || !isSelectedRoom || !isSelectedStash {
                filteredArticles = userArticles.filter { $0.name.lowercased().contains(name.lowercased()) }
            } else {
                filteredArticlesWithStock = articlesWithStock.filter { $0.article.name.lowercased().contains(name.lowercased()) }
            }
            return true
        } else {
            return false
        }
    }

    func goToDetail(article: Article, typesArticle: [TypeArticle],selectedRoom: ContentRoom, selectedStash: ContentStash) {
        goingIntoDetailOrEdit = true
        router.goToDetail(article: article , typesArticle: typesArticle, selectedRoom: selectedRoom, selectedStash: selectedStash)
    }

    func goToAddArticle() {
        goingIntoDetailOrEdit = true
        if selectedRoom == nil {
            selectedRoom = ContentRoom(room: Room(id: 0, name: "", base64image: "", description: "", idTypeRoom: 0), stashes: [], articles: [])
        }
        if selectedStash == nil {
            selectedStash = ContentStash(stash: Stash(id: 0, name: "", description: "", base64image: "", idTypeStash: 0), articles: [])
        }
        router.goToAddArticle(Article(id: 0, name: "", base64image: "", description: "", idUser: 0, idTypeArticle: 0), typesArticle: typesArticle, selectedRoom: selectedRoom, selectedStash: selectedStash)
    }

    func clearSelectedRoomAndStash() {
        roomsUseCase.removeSelectedRoom()
        stashesUseCase.removeSelectedStash()
    }
}

extension ArticlesViewModel: ArticleDelegate {
    func checkIsSelectedRoom() -> Bool {
        isSelectedRoom
    }

    func goToEditArticle(_ article: Article) {
        goingIntoDetailOrEdit = true
        if selectedStash == nil {
            selectedStash = ContentStash(stash: Stash(id: 0, name: "", description: "", base64image: "", idTypeStash: 0), articles: [])
        }
        router.goToEditArticle(article, typesArticle: typesArticle, selectedRoom: selectedRoom, selectedStash: selectedStash)
    }

    func modifyArticleStock(_ article: Article, increment: Int) {
        guard isSelectedRoom else { return }
        for (index, contentRoom) in contentsRoom.enumerated() {
            guard contentRoom.room.id == selectedRoom.room.id else { continue }
            if !isSelectedStash {
                modifyArticleInList(&contentsRoom[index].articles, article: article, increment: increment)
            } else {
                guard isSelectedStash else { return }
                for (indexStash, contentStash) in contentsRoom[index].stashes.enumerated() {
                    guard contentStash.stash.id == selectedStash.stash.id else { continue }
                    modifyArticleInList(&contentsRoom[index].stashes[indexStash].articles, article: article, increment: increment)
                }
            }
            break
        }
        do {
            try linksUseCase.setContentRooms(contentsRoom)
            getData()
            refreshCollectionView?()
        } catch {
            // Handle error
        }
    }

    func modifyArticleInList(_ articles: inout [ArticleWithStock], article: Article, increment: Int) {
        if let index = articles.firstIndex(where: { $0.article.id == article.id }) {
            articles[index].stock += increment
            if articles[index].stock <= 0 {
                articles.remove(at: index)
            }
        } else if increment > 0 {
            articles.append(ArticleWithStock(article: article, stock: 1))
        }
    }

    func addArticleStock(_ article: Article) {
        modifyArticleStock(article, increment: 1)
    }

    func removeArticleStock(_ article: Article) {
        modifyArticleStock(article, increment: -1)
    }
}
