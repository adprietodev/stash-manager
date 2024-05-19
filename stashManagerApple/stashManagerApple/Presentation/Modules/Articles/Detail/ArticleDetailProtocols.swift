//
//  ArticleDetailProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

protocol ArticleDetailViewModelProtocol  {
    var article: Article { get set }
    var typesArticle: [TypeArticle] { get set }
    func goToEdit()
    var loadView: (() -> Void)? { get set }
}

protocol ArticleDetailRouterProtocol {
    func goToEditArticle(_ article: Article, typesArticle: [TypeArticle], selectedRoom: ContentRoom, selectedStash: ContentStash)
}
