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

    func goToEditProfile(user: User) {
        let profileEditViewController = ProfileEditBuilder().build(user)
        viewController.navigationController?.pushViewController(profileEditViewController, animated: true)
    }
}
