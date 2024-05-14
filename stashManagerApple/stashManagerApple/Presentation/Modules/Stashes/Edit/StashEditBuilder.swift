//
//  StashEditBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashEditBuilder {
    func build(stash: Stash, typesStash: [TypeStash], typeAction: TypeAction) -> StashEditViewController {
        let viewController = StashEditViewController()
        let router = StashEditRouter(viewController: viewController)
        viewController.viewModel = StashEditViewModel(router: router, stash: stash, typesStash: typesStash, typeAction: typeAction)
        return viewController
    }
}
