//
//  StashDetailRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashDetailRouter: StashDetailRouterProtocol {
    let viewController: StashDetailViewController

    init(viewController: StashDetailViewController) {
        self.viewController = viewController
    }

    func goToEditStash(stash: Stash, typesStash: [TypeStash]) {
        let stashEditViewController = StashEditBuilder().build(stash: stash, typesStash: typesStash)
        viewController.navigationController?.pushViewController(stashEditViewController, animated: true)
    }
}
