//
//  StashesLocalDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation

protocol StashesLocalDatasourceProtocol {
    func getSelectedStash() throws -> StashDTO?
    func setSelectedStash(_ stashDTO: StashDTO) throws
    func removeSelectedStash()
}
