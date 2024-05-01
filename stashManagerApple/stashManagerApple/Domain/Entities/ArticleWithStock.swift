//
//  ArticleWithStock.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 1/5/24.
//

import Foundation

class ArticleWithStock {
    let article : Article
    var stock: Int

    init(article: Article, stock: Int) {
        self.article = article
        self.stock = stock
    }
}
