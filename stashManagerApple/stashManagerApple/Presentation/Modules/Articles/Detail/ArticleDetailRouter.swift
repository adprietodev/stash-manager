//
//  ArticleDetailRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class ArticleDetailRouter: ArticleDetailRouterProtocol {
    let viewController: ArticleDetailViewController

    init(viewController: ArticleDetailViewController) {
        self.viewController = viewController
    }

    func goToEdit(article: Article, typesArticle: [TypeArticle]) {
        let articleEditViewController = ArticleEditBuilder().build(article: article, typesArticle: typesArticle)
        viewController.navigationController?.pushViewController(articleEditViewController, animated: true)
    }
}
