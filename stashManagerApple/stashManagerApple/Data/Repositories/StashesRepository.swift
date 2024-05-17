//
//  StashRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class StashesRepository: StashesRepositoryProtocol {
    let remoteDatasource: StashesRemoteDatasourceProtocol
    let localDarasource: StashesLocalDatasourceProtocol

    init(remoteDatasource: StashesRemoteDatasourceProtocol, localDatasource: StashesLocalDatasourceProtocol) {
        self.remoteDatasource = remoteDatasource
        self.localDarasource = localDatasource
    }

    func getRemoteStashes() async throws -> [Stash] {
        let stashDTO = try await remoteDatasource.getStashes()
        return stashDTO.map { $0.toDomain() }
    }

    func updateStash(_ stash: Stash) async throws {
        try await remoteDatasource.updateStash(stash.toDTO())
    }

    func insertStash(_ stash: Stash) async throws {
        try await remoteDatasource.insertStash(stash.toDTO())
    }

    func deleteStash(_ stash: Stash) async throws {
        let stashDTO = stash.toDTO()
        try await remoteDatasource.deleteStash(stashDTO)
    }

    func getRemoteTypesStash() async throws -> [TypeStash] {
        let typeStashDTO = try await remoteDatasource.getTypesStash()
        return typeStashDTO.map { $0.toDomain() }
    }

    func getSelectedStash() throws -> Stash? {
        let stashDTO = try localDarasource.getSelectedStash()
        return stashDTO?.toDomain()
    }

    func setSelectedStash(_ stash: Stash) throws {
        try localDarasource.setSelectedStash(stash.toDTO())
    }

    func removeSelectedStash() {
        localDarasource.removeSelectedStash()
    }
}

fileprivate extension StashDTO {
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
        TypeStash(id: self.id, name: TypesStash(rawValue: self.name) ?? .none)
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
