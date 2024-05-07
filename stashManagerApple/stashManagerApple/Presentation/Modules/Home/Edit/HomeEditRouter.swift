//
//  HomeEditRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 7/5/24.
//

import Foundation

class HomeEditRouter: HomeEditRouterProtocol {
    // MARK: - Properties
    var viewController: HomeEditViewController

    init(viewController: HomeEditViewController) {
        self.viewController = viewController
    }
}
