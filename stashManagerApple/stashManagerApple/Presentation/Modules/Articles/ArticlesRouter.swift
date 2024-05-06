//
//  ArticlesRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class ArticlesRouter: ArticlesRouterProtocol {
    let viewController: ArticlesViewController

    init(viewController: ArticlesViewController) {
        self.viewController = viewController
    }
}
