//
//  LoginProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 25/4/24.
//

import Foundation

protocol LoginViewModelProtocol {
    func login(with email: String, at password: String) 
}

protocol LoginRouterProtocol {
    func goToTabBar()
}
