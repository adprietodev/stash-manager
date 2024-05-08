//
//  StashesRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class StashesRouter: StashesRouterProtocol {
    let viewController: StashesViewController

    init(viewController: StashesViewController) {
        self.viewController = viewController
    }

    func goToDetail(stash: Stash, typesStash: [TypeStash]) {
        let stashDetailViewController = StashDetailBuilder().build(stash: stash, typesStash: typesStash)
        viewController.navigationController?.pushViewController(stashDetailViewController, animated: true)
    }
}
