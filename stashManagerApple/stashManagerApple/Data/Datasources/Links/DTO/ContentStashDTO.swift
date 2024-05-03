//
//  ContentStashDTO.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation
class ContentStashDTO: Codable {
    let stash: StashDTO
    var articles: [ArticleWithStockDTO]

    init(stash: StashDTO, articles: [ArticleWithStockDTO]) {
        self.stash = stash
        self.articles = articles
    }
}
