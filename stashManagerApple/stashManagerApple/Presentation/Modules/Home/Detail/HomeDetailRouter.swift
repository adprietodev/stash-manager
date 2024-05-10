//
//  HomeDetailRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

class HomeDetailRouter: HomeDetailRouterProtocol {
    let viewController: HomeDetailViewController

    init(viewController: HomeDetailViewController) {
        self.viewController = viewController
    }

    func goToEditRoom(room: Room, typesRoom: [TypeRoom]) {
        let homeEditViewController = HomeEditBuilder().build(room: room, typesRoom: typesRoom)
        self.viewController.navigationController?.pushViewController(homeEditViewController, animated: true)
    }

    func goToStashesRoom() {
        if let tabBarController = viewController.tabBarController {
            tabBarController.selectedIndex = 1
        }
        if let navigationController = viewController.navigationController {
            navigationController.popToRootViewController(animated: false)
        }
    }
}
