//
//  StashEditProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

protocol StashEditViewModelProtocol {
    var stash: Stash { get set }
    var typesStash: [TypeStash] { get set }
}
