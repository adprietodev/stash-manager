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

    func goToDetail(article: Article, typesArticle: [TypeArticle],selectedRoom: ContentRoom, selectedStash: ContentStash) {
        let articleDetailViewController = ArticleDetailBuilder().build(article: article, typesArticle: typesArticle,selectedRoom: selectedRoom, selectedStash: selectedStash)
        viewController.navigationController?.pushViewController(articleDetailViewController, animated: true)
    }

    func goToEditArticle(_ article: Article, typesArticle: [TypeArticle], selectedRoom: ContentRoom, selectedStash: ContentStash) {
        let articleEditViewController = ArticleEditBuilder().build(article: article, typesArticle: typesArticle, typeAction: .edit, selectedRoom: selectedRoom, selectedStash: selectedStash)
        viewController.navigationController?.pushViewController(articleEditViewController, animated: true)
    }

    func goToAddArticle(_ article: Article, typesArticle: [TypeArticle], selectedRoom: ContentRoom, selectedStash: ContentStash) {
        let articleEditViewController = ArticleEditBuilder().build(article: article, typesArticle: typesArticle, typeAction: .add, selectedRoom: selectedRoom, selectedStash: selectedStash)
        viewController.navigationController?.pushViewController(articleEditViewController, animated: true)
    }
}
