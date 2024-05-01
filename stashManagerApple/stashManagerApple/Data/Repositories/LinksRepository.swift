//
//  LinksRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 1/5/24.
//

import Foundation

class LinksRepository: LinksRepositoryProtocol {
    let datasource: LinksDatasourceProtocol

    init(datasource: LinksDatasourceProtocol) {
        self.datasource = datasource
    }

    func getLink(at roomID: Int) async throws -> Link {
        let linkDTO = try await datasource.getLinks(at: roomID)
        guard let link = linkDTO.map { $0.toDomain() }.first else { return Link(id: 0, idRoom: 0, idStash: 0, idArticle: 0, stockArticle: 0)}
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
