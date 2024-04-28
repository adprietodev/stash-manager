//
//  LoginProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 25/4/24.
//

import Foundation

protocol LoginViewModelProtocol {
    var loginError: (()-> Void)? { get set }
    func login(with email: String, at password: String)
}

protocol LoginRouterProtocol {
    func goToTabBar()
}
