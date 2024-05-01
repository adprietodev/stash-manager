//
//  StashRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class StashesRepository: StashesRepositoryProtocol {
    let datasource: StashesDatasourceProtocol

    init(datasource: StashesDatasourceProtocol) {
        self.datasource = datasource
    }

    func getStashes() async throws -> [Stash] {
        let stashDTO = try await datasource.getStashes()
        return stashDTO.map { $0.toDomain() }
    }

    func getTypesStash() async throws -> [TypeStash] {
        let typeStashDTO = try await datasource.getTypesStash()
        return typeStashDTO.map { $0.toDomain() }
    }
}

fileprivate extension StashesDTO {
    func toDomain() -> Stash {
        Stash(id: self.id,
              name: self.name,
              description: self.description ?? "",
              base64image: self.base64image ?? "",
              idTypeStash: self.idTypeStash)
    }
}

fileprivate extension TypeStashDTO {
    func toDomain() -> TypeStash {
        TypeStash(id: self.id, name: self.name)
    }
}
