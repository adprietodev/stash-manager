//
//  ProfileRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class ProfileRouter: ProfileRouterProtocol {
    let viewController: ProfileViewController

    init(viewController: ProfileViewController) {
        self.viewController = viewController
    }

    func goToEditProfile(user: User) {
        let profileEditViewController = ProfileEditBuilder().build(user)
        viewController.navigationController?.pushViewController(profileEditViewController, animated: true)
    }

    func goToLogout() {
        DispatchQueue.main.async { [weak self] in
            guard let self =  self else { return }
            let loginViewController = LoginBuilder().build()
            let navigationController = UINavigationController(rootViewController: loginViewController)
            guard let sceneDelegate =  UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
            sceneDelegate.window?.rootViewController = navigationController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}
