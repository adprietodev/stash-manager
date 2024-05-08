//
//  ArticleEditProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

protocol ArticleEditViewModelProtocol{
    var article: Article { get set }
    var typesArticle: [TypeArticle] { get set }
}
