//
//  HomeDetailBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

class HomeDetailBuilder {
    func build(room: Room, typesRoom: [TypeRoom]) -> HomeDetailViewController {
        let viewController = HomeDetailViewController(nibName: "HomeDetailViewController", bundle: nil)
        let router = HomeDetailRouter(viewController: viewController)
        viewController.viewModel = HomeDetailViewModel(router: router, room: room, typesRoom: typesRoom)
        return viewController
    }
}
