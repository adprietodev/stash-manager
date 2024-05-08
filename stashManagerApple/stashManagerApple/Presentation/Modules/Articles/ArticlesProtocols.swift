//
//  ArticlesProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

protocol ArticlesViewModelProtocol {
    var typesArticle: [TypeArticle]! { get set }
    func goToDetail(article: Article, typesArticle: [TypeArticle])
}

protocol ArticlesRouterProtocol {
    func goToDetail(article: Article, typesArticle: [TypeArticle])
}
