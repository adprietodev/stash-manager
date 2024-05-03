//
//  ArticlesWithStockDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation

class ArticleWithStockDTO: Codable {
    let article : ArticleDTO
    var stock: Int

    init(article: ArticleDTO, stock: Int) {
        self.article = article
        self.stock = stock
    }
}
