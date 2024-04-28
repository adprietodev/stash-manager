//
//  SplashBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import UIKit

class SplashBuilder {
    func build() -> SplashViewController {
        let viewController = SplashViewController(nibName: "SplashViewController", bundle: nil)
        let router = SplashRouter(viewController: viewController)
        viewController.viewModel = SplashViewModel(router: router)
        return viewController
    }
}
