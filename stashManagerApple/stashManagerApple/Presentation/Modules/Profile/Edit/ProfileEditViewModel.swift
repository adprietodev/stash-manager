//
//  ProfileEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 9/5/24.
//

import Foundation

class ProfileEditViewModel: ProfileEditViewModelProtocol {
    var user: User

    init(user: User) {
        self.user = user
    }
}
