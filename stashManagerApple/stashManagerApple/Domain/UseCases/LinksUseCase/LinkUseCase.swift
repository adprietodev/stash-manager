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
            links.append(link)
        }
        return createContentRooms(links: links, rooms: rooms, stashes: stashes, articles: articles)
    }

    func getLocalContentRooms() throws -> [ContentRoom]? {
        try repository.getContentRoom()
    }

    func setContentRooms(_ contentRoom: [ContentRoom]) throws {
        try repository.setContentRoom(contentRoom)
    }

    func removeContentRooms(){
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

            guard let room = roomsDict[roomID], let article = articlesDict[articleID] else {
                continue
            }

            var stash: Stash?
            if let stashID = stashID {
                stash = stashesDict[stashID]
            }

            let articleWithStock = ArticleWithStock(article: article, stock: stockArticle)

            if let existingContentRoom =  contentRooms.first(where: {$0.room.id == roomID}) {
                if let stash = stash {
                    if let existingContentStash = existingContentRoom.stashes.first(where: { $0.stash.id == stashID }) {
                        existingContentStash.articles.append(articleWithStock)
                    } else {
                        let newContentStash = ContentStash(stash: stash, articles: [articleWithStock])
                        existingContentRoom.stashes.append(newContentStash)
                    }
                } else {
                    existingContentRoom.articles.append(articleWithStock)
                }
            } else {
                var contentStashes = [ContentStash]()
                if let stash = stash {
                    let newContentStash = ContentStash(stash: stash, articles: [articleWithStock])
                    contentStashes.append(newContentStash)
                } else {
                    let newContentRoom = ContentRoom(room: room, stashes: contentStashes, articles: [articleWithStock])
                    contentRooms.append(newContentRoom)
                    continue
                }
                let newContentRoom = ContentRoom(room: room, stashes: contentStashes, articles: [])
                contentRooms.append(newContentRoom)
            }
        }
        return contentRooms
    }
}