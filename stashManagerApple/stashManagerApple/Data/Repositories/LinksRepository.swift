//
//  LinksRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 1/5/24.
//

import Foundation

class LinksRepository: LinksRepositoryProtocol {
    let remoteDatasource: LinksRemoteDatasourceProtocol
    let localDatasource: LinksLocalDatasourceProtocol

    init(remoteDatasource: LinksRemoteDatasourceProtocol, localDatasource: LinksLocalDatasourceProtocol) {
        self.remoteDatasource = remoteDatasource
        self.localDatasource = localDatasource
    }

    func getRemoteLink(at roomID: Int) async throws -> [Link]? {
        let linkDTO = try await remoteDatasource.getLinks(at: roomID)
        let link = linkDTO.map({ $0.toDomain() })
        return link
    }

    func getContentRoom() throws -> [ContentRoom]? {
        let contentRoomDTO = try localDatasource.getContentRoom()
        return contentRoomDTO?.map { $0.toDomain() }
    }

    func setContentRoom(_ contentRoom: [ContentRoom]) throws {
        try localDatasource.setContentRoom(contentRoom.map { $0.toDTO() })
    }

    func removeContentRoom() {
        localDatasource.removeContentRoom()
    }
}

fileprivate extension LinkDTO {
    func toDomain() -> Link {
        Link(id: self.id,
             idRoom: self.idRoom,
             idStash: self.idStash,
             idArticle: self.idArticle,
             stockArticle: self.stockArticle)
    }
}

fileprivate extension Link {
    func toDTO() -> LinkDTO {
        LinkDTO(id: self.id, idRoom: self.idRoom, idStash: self.idStash, idArticle: self.idArticle, stockArticle: self.stockArticle)
    }
}

fileprivate extension ContentRoomDTO {
    func toDomain() -> ContentRoom {
        ContentRoom(room: self.room.toDomain(), stashes: self.stashes.map { $0.toDomain()}, articles: self.articles.map { $0.toDomain() })
    }
}

fileprivate extension ContentRoom {
    func toDTO() -> ContentRoomDTO {
        ContentRoomDTO(room: self.room.toDTO(), stashes: self.stashes.map { $0.toDTO() }, articles: self.articles.map { $0.toDTO() })
    }
}

fileprivate extension RoomDTO {
    func toDomain() -> Room {
        Room(id: self.id,
             name: self.name,
             base64image: self.base64image ?? "",
             description: self.description ?? "",
             idTypeRoom: self.idTypeRoom)
    }
}

fileprivate extension Room {
    func toDTO() -> RoomDTO {
        RoomDTO(id: self.id,
                name: self.name,
                base64image: self.base64image,
                description: self.description,
                idTypeRoom: self.idTypeRoom)
    }
}

fileprivate extension ContentStashDTO {
    func toDomain() -> ContentStash {
        ContentStash(stash: self.stash.toDomain(), articles: self.articles.map { $0.toDomain() })
    }
}

fileprivate extension ContentStash {
    func toDTO() -> ContentStashDTO {
        ContentStashDTO(stash: self.stash.toDTO(), articles: self.articles.map { $0.toDTO() })
    }
}

fileprivate extension StashDTO {
    func toDomain() -> Stash {
        Stash(id: self.id,
              name: self.name,
              description: self.description ?? "",
              base64image: self.base64image ?? "",
              idTypeStash: self.idTypeStash, idRoom: self.idRoom)
    }
}

fileprivate extension Stash {
    func toDTO() -> StashDTO {
        StashDTO(id: self.id,
                 name: self.name,
                 description: self.description,
                 base64image: self.base64image,
                 idTypeStash: self.idTypeStash,
                 idRoom: self.idRoom)
    }
}

fileprivate extension ArticleWithStockDTO {
    func toDomain() -> ArticleWithStock {
        ArticleWithStock(article: self.article.toDomain(), stock: self.stock)
    }
}

fileprivate extension ArticleWithStock {
    func toDTO() -> ArticleWithStockDTO {
        ArticleWithStockDTO(article: self.article.toDTO(), stock: self.stock)
    }
}

fileprivate extension ArticleDTO {
    func toDomain() -> Article {
        Article(id: self.id,
                name: self.name,
                base64image: self.base64image ?? "",
                description: self.description ?? "",
                idUser: self.idUser,
                idTypeArticle: self.idTypeArticle)
    }
}

fileprivate extension Article {
    func toDTO() -> ArticleDTO {
        ArticleDTO(id: self.id,
                   name: self.name,
                   base64image: self.base64image,
                   description: self.description,
                   idUser: self.idUser,
                   idTypeArticle: self.idTypeArticle)
    }
}
