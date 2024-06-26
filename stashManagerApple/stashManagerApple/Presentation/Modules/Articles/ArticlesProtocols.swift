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
    var filteredArticles: [Article] { get set }
    var filteredArticlesWithStock: [ArticleWithStock] { get set }
    var isFiltering: Bool { get set}
    func clearSelectedRoomAndStash()
    func goToAddArticle()
    func goToDetail(article: Article, typesArticle: [TypeArticle],selectedRoom: ContentRoom, selectedStash: ContentStash)
    func isFilterArticle(by name: String) -> Bool
    var showAlertRemoveArtilce:((Article) -> Void)? { get set }
    func removeArticleUser(_ article: Article)
    func removeArticleLink(_ article: Article)
}

protocol ArticlesRouterProtocol {
    func goToDetail(article: Article, typesArticle: [TypeArticle],selectedRoom: ContentRoom, selectedStash: ContentStash)
    func goToEditArticle(_ article: Article, typesArticle: [TypeArticle])
    func goToAddArticle(_ article: Article, typesArticle: [TypeArticle])
}
