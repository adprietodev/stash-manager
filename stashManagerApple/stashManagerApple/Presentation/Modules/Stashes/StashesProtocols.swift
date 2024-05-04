//
//  StashesViewModelProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 4/5/24.
//

import Foundation

protocol StashesViewModelProtocol {
    func getData()
    var selectedRoom: ContentRoom! { get set }
    var stashes : [Stash] { get set }
    var typesStash: [TypeStash] { get set}
    var contentsRoom: [ContentRoom] { get set}
    var isSelectedRoom: Bool { get set }
    var refreshCollectionView: (() -> Void)? { get set }
}

protocol StashesRouterProtocol {
}
