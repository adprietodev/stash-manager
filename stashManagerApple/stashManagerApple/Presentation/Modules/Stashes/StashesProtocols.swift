//
//  StashesViewModelProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 4/5/24.
//

import Foundation

protocol StashesViewModelProtocol {
    func getData()
    var selectedRoom: ContentRoom? { get set }
    var stashes : [Stash] { get set }
    var typesStash: [TypeStash] { get set}
    var contentsRoom: [ContentRoom] { get set}
    var isSelectedRoom: Bool { get set }
    var refreshCollectionView: (() -> Void)? { get set }
    var isFiltering: Bool { get set }
    var filteredStashes: [Stash] { get set }
    func goToDetail(stash: Stash)
    func checkSelectedStash()
    func isFilterStashes(by name: String) -> Bool
    func goToAddStash()
}

protocol StashesRouterProtocol {
    func goToDetail(room: Room, stash: Stash, typesStash: [TypeStash])
    func goToAddStash(stash: Stash, typesStash: [TypeStash], typeAction: TypeAction, room: Room)
}
