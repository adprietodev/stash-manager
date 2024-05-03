//
//  LinksLocalDatasourceProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation

protocol LinksLocalDatasourceProtocol {
    func getSelectedStash() throws -> Stash?
    func setSelectedStash(_ stash: Stash) throws
    func removeSelectedStash()
}
