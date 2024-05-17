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

    func goToDetail(room: Room, stash: Stash, typesStash: [TypeStash]) {
        let stashDetailViewController = StashDetailBuilder().build(room: room, stash: stash, typesStash: typesStash)
        viewController.navigationController?.pushViewController(stashDetailViewController, animated: true)
    }

    func goToAddStash(stash: Stash, typesStash: [TypeStash], typeAction: TypeAction, room: Room) {
        let stashEditViewController = StashEditBuilder().build(stash: stash, typesStash: typesStash, typeAction: typeAction, room: room)
        viewController.navigationController?.pushViewController(stashEditViewController, animated: true)
    }
}
