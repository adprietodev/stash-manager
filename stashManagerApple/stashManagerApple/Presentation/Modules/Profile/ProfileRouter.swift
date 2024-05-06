//
//  ProfileRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ProfileRouter: ProfileRouterProtocol {
    let viewController: ProfileViewController

    init(viewController: ProfileViewController) {
        self.viewController = viewController
    }
}
