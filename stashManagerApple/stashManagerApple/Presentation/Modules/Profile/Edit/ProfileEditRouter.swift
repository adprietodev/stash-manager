//
//  ProfileEditRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 19/5/24.
//

import Foundation

class ProfileEditRouter: ProfileEditRouterProtocol {
    let viewController: ProfileEditViewController

    init(viewController: ProfileEditViewController) {
        self.viewController = viewController
    }

    func finishEditUser() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            viewController.navigationController?.popViewController(animated: true)
        }
    }
}
