//
//  SplashViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation

class SplashViewModel: SplashViewModelProtocol {
    var router: SplashRouterProtocol

    init(router: SplashRouterProtocol) {
        self.router = router
    }
}
