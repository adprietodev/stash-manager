//
//  ProfileEditBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 9/5/24.
//

import Foundation

class ProfileEditBuilder {
    func build(_ user: User) -> ProfileEditViewController {
        let viewController = ProfileEditViewController(nibName: "ProfileEditViewController", bundle: nil)
        viewController.viewModel = ProfileEditViewModel(user: user)
        return viewController
    }
}
