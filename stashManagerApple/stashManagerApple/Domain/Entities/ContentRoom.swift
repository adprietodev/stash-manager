//
//  ContentsRoom.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 1/5/24.
//

import Foundation

class ContentRoom {
    let room: Room
    var stashes: [ContentStash]
    var articles: [ArticleWithStock]

    init(room: Room, stashes: [ContentStash], articles: [ArticleWithStock]) {
        self.room = room
        self.stashes = stashes
        self.articles = articles
    }
}
