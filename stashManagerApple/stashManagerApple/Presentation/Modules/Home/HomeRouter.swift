//
//  HomeRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class HomeRouter: HomeRouterProtocol {
    var viewController: HomeViewController

    init(viewController: HomeViewController) {
        self.viewController = viewController
    }

    func goToRoomDetail(room: Room, typesRoom: [TypeRoom]) {
        let homeDetailViewController = HomeDetailBuilder().build(room: room, typesRoom: typesRoom)
        viewController.navigationController?.pushViewController(homeDetailViewController, animated: true)
    }

    func goToAddRoom(room: Room, typesRoom: [TypeRoom], typeAction: TypeAction) {
        let homeEditViewController = HomeEditBuilder().build(room: room, typesRoom: typesRoom, typeAction: typeAction)
        viewController.navigationController?.pushViewController(homeEditViewController, animated: true)
    }
}
