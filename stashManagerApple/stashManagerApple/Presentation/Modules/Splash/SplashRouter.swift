//
//  SplashRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation

class SplashRouter: SplashRouterProtocol {
    var viewController: SplashViewController

    init(viewController: SplashViewController) {
        self.viewController = viewController
    }
}
