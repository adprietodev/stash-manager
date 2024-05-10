//
//  ArticlesProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import Foundation

protocol ArticlesViewModelProtocol {
    var typesArticle: [TypeArticle]! { get set }
    var showAllArticles: Bool { get set }
    var goingIntoDetailOrEdit: Bool { get set }
    var currentSegmentSelected: Int { get set }
    func clearSelectedRoomAndStash()
    func goToDetail(article: Article, typesArticle: [TypeArticle])
}

protocol ArticlesRouterProtocol {
    func goToDetail(article: Article, typesArticle: [TypeArticle])
    func goToEditArticle(_ article: Article, typesArticle: [TypeArticle])
}
