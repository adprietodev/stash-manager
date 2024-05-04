//
//  SplashProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation

protocol SplashViewModelProtocol {
    var finishLoad : (() -> Void)? { get set }
    func chargeData()
}

protocol SplashRouterProtocol {
    func goToTabBar()
}
