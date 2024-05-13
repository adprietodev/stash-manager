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
    func showCustomPickerType()
    func setCurrentType() 
}

protocol ArticleEditRouterProtocol {
    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String)
}
