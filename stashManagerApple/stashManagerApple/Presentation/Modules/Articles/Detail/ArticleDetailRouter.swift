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

    func goToEditArticle(_ article: Article, typesArticle: [TypeArticle], selectedRoom: ContentRoom, selectedStash: ContentStash) {
        let articleEditViewController = ArticleEditBuilder().build(article: article, typesArticle: typesArticle, typeAction: .edit)
        viewController.navigationController?.pushViewController(articleEditViewController, animated: true)
    }
}
