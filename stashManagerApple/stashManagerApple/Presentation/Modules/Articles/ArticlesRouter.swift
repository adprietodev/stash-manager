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

    func goToDetail(article: Article, typesArticle: [TypeArticle]) {
        let articleDetailViewController = ArticleDetailBuilder().build(article: article, typesArticle: typesArticle)
        viewController.navigationController?.pushViewController(articleDetailViewController, animated: true)
    }
}
