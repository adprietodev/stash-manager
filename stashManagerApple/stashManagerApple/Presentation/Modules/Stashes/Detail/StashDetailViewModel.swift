//
//  StashesDetailViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashDetailViewModel: StashDetailViewModelProtocol {
    // MARK: - Properties
    var router: StashDetailRouter
    var stash: Stash
    var typesStash: [TypeStash]

    init(router: StashDetailRouter, stash: Stash, typesStash: [TypeStash]) {
        self.router = router
        self.stash = stash
        self.typesStash = typesStash
    }

    func goToEditStash() {
        router.goToEditStash(stash: stash, typesStash: typesStash)
    }
}
