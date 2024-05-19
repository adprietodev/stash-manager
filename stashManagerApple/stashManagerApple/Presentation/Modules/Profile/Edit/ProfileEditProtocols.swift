//
//  ProfileEditProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 9/5/24.
//

import Foundation

protocol ProfileEditViewModelProtocol {
    var user: User { get set }
    var imageBase64: String { get set }
    func editUser(nameUser: String, lastName: String)
    func finishEditUser()
}

protocol ProfileEditRouterProtocol {
    func finishEditUser()
}
