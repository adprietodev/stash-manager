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

    func getRemoteLink(at roomID: Int) async throws -> Link? {
        let linkDTO = try await remoteDatasource.getLinks(at: roomID)
        let link = linkDTO.map({ $0.toDomain() }).first
        return link
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
