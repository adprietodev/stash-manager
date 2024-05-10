//
//  ProfileProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

protocol ProfileViewModelProtocol {
    var loadView: (() -> Void)? { get set }
    var user: User! { get set }
    func loadUserData()
    func goToEditProfile()
}

protocol ProfileRouterProtocol {
    func goToEditProfile(user: User)
}
