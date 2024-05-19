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
    var isGoingToArticle: Bool { get set }
    var uploadView: (() -> Void)? { get set }
    func goToEditStash()
    func updateStash()
}

protocol StashDetailRouterProtocol {
    func goToEditStash(stash: Stash, typesStash: [TypeStash], room: Room)
}
