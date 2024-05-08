//
//  StashDetailBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashDetailBuilder {
    func build(stash: Stash, typesStash: [TypeStash]) -> StashDetailViewController {
        let viewController = StashDetailViewController(nibName: "StashDetailViewController", bundle: nil)
        let router = StashDetailRouter(viewController: viewController)
        viewController.viewModel = StashDetailViewModel(router: router, stash: stash, typesStash: typesStash)
        return viewController
    }
}
