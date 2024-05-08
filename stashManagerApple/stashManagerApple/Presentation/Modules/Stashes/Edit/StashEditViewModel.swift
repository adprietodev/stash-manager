//
//  StashEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashEditViewModel{
    // MARK: - Properties
    var stash: Stash
    var typesStash: [TypeStash]

    init(stash: Stash, typesStash: [TypeStash]) {
        self.stash = stash
        self.typesStash = typesStash
    }
}
