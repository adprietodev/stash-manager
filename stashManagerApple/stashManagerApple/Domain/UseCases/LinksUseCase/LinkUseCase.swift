//
//  LinkUseCase.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 1/5/24.
//

import Foundation

class LinkUseCase: LinkUseCaseProtocol {
    // MARK: - Properties
    let repository: LinksRepositoryProtocol

    init(repository: LinksRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Funtions
    func getContentRooms(with roomIDs: [Int], of rooms: [Room], of stashes: [Stash], at articles: [Article]) async throws -> [ContentRoom] {
        var links = [Link]()
        for roomId in roomIDs {
            guard let link = try await repository.getRemoteLink(at: roomId) else { continue }
            links += link
        }
        var contentRoom = createContentRooms(links: links, rooms: rooms, stashes: stashes, articles: articles)
        try repository.setContentRoom(contentRoom)
        return contentRoom
    }

    func getLinksStash(at stashID: Int) async throws -> [Link] {
        try await repository.getLinksStash(at: stashID)
    }

    func updateLink(_ link: Link, typeScreens: TypesScreens) async throws {
        try await deleteLink(at: link.id)
        try await insertLink(link, typeScreen: typeScreens)
    }

    func insertLink(_ link: Link, typeScreen: TypesScreens) async throws {
        try await repository.insertLink(link, typeScreen: typeScreen)
    }

    func getLocalContentRooms() throws -> [ContentRoom]? {
        try repository.getContentRoom()
    }

    func setContentRooms(_ contentRoom: [ContentRoom]) throws {
        try repository.setContentRoom(contentRoom)
    }

    func getIdLinkToModify(roomID: Int, stashID: Int, articleID: Int, typeScreen: TypesScreens) async throws -> [Link] {
        try await repository.getIdLinkToModify(roomID: roomID, stashID: stashID, articleID: articleID, typeScreen: typeScreen)
    }

    func deleteLink(at linkID: Int) async throws {
        try await repository.deleteLink(at: linkID)
    }

    func removeContentRooms() {
        repository.removeContentRoom()
    }

    func createContentRooms(links: [Link], rooms: [Room], stashes: [Stash], articles: [Article]) -> [ContentRoom] {
        var contentRooms = [ContentRoom]()

        var roomsDict: [Int: Room] = [:]
        var stashesDict: [Int: Stash] = [:]
        var articlesDict: [Int: Article] = [:]

        for room in rooms {
            roomsDict[room.id] = room
        }

        for stash in stashes {
            stashesDict[stash.id] = stash
        }

        for article in articles {
            articlesDict[article.id] = article
        }

        for link in links {
            let roomID = link.idRoom
            let stashID = link.idStash
            let articleID = link.idArticle
            let stockArticle = link.stockArticle

            guard let room = roomsDict[roomID] else {
                continue
            }

            var stash: Stash?
            if let stashID = stashID {
                stash = stashesDict[stashID]
                stash?.idRoom = roomID
            }

            var articleWithStock: ArticleWithStock? = nil
            if let articleID = articleID, let stockArticle = stockArticle, let article = articlesDict[articleID] {
                articleWithStock = ArticleWithStock(article: article, stock: stockArticle)
            }

            if let existingContentRoom = contentRooms.first(where: { $0.room.id == roomID }) {
                if let stash = stash {
                    if let existingContentStash = existingContentRoom.stashes.first(where: { $0.stash.id == stashID }) {
                        if let articleWithStock = articleWithStock {
                            existingContentStash.articles.append(articleWithStock)
                        }
                    } else {
                        var newContentStash = ContentStash(stash: stash, articles: [])
                        if let articleWithStock = articleWithStock {
                            newContentStash.articles.append(articleWithStock)
                        }
                        existingContentRoom.stashes.append(newContentStash)
                    }
                } else {
                    if let articleWithStock = articleWithStock {
                        existingContentRoom.articles.append(articleWithStock)
                    }
                }
            } else {
                var contentStashes = [ContentStash]()
                if let stash = stash {
                    var newContentStash = ContentStash(stash: stash, articles: [])
                    if let articleWithStock = articleWithStock {
                        newContentStash.articles.append(articleWithStock)
                    }
                    contentStashes.append(newContentStash)
                    articleWithStock = nil
                }
                var newContentRoom = ContentRoom(room: room, stashes: contentStashes, articles: [])
                if let articleWithStock = articleWithStock {
                    newContentRoom.articles.append(articleWithStock)
                }
                contentRooms.append(newContentRoom)
            }
        }
        return contentRooms
    }
}
