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

    func goToEditStash(stash: Stash, typesStash: [TypeStash], room: Room) {
        let stashEditViewController = StashEditBuilder().build(stash: stash, typesStash: typesStash, typeAction: .edit, room: room)
        viewController.navigationController?.pushViewController(stashEditViewController, animated: true)
    }

    func goToArticleInStash() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if let tabBarController = viewController.tabBarController {
                tabBarController.selectedIndex = 2
            }
            if let navigationController = viewController.navigationController {
                navigationController.popToRootViewController(animated: false)
            }
        }
    }
}
