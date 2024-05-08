//
//  StashDetailProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

protocol StashDetailViewModelProtocol {
    var stash: Stash { get set }
    var typesStash: [TypeStash] { get set }
    func goToEditStash()
}

protocol StashDetailRouterProtocol {
    func goToEditStash(stash: Stash, typesStash: [TypeStash])
}
