//
//  ArticleEditProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

protocol ArticleEditViewModelProtocol {
    var article: Article { get set }
    var typesArticle: [TypeArticle] { get set }
    var currentType: String { get set }
    var typeButtonPressed: TypeButtonPressed? { get set }
    var typeAction: TypeAction { get set }
    func showCustomPickerType()
    func setCurrentType()
    func updateArticle()
    func addArticleUser()
    func setNameArticle(_ name: String)
    func setDescription(_ description: String)
    func setTypeArticle(_ nameType: String)
}

protocol ArticleEditRouterProtocol {
    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String,typeAction: TypeAction, typeButtonPressed: TypeButtonPressed)
    func finishEditOrAddArticle() 
}
