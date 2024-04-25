//
//  HomeBuilder.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class HomeBuilder {
    func build() -> HomeViewController {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        return viewController
    }
}
