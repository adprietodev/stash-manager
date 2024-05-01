//
//  LoginRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    // MARK: - Properties
    let viewController: LoginViewController

    init(viewController: LoginViewController) {
        self.viewController = viewController
    }

    // MARK: - Functions
    func goToSplashLoadData(uuid: UUID) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let splashViewController = SplashBuilder().build(uuid: uuid)
            viewController.navigationController?.pushViewController(splashViewController, animated: true)
        }
    }
}
