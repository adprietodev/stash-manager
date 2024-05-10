//
//  ContentStash.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 1/5/24.
//

import Foundation

class ContentStash {
    var stash: Stash
    var articles: [ArticleWithStock]

    init(stash: Stash, articles: [ArticleWithStock]) {
        self.stash = stash
        self.articles = articles
    }
}
