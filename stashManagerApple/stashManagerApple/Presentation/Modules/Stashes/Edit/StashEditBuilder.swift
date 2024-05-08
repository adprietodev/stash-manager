//
//  StashEditBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashEditBuilder {
    func build(stash: Stash, typesStash: [TypeStash]) -> StashEditViewController {
        let viewController = StashEditViewController()
        viewController.viewModel = StashEditViewModel(stash: stash, typesStash: typesStash)
        return viewController
    }
}
