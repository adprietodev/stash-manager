//
//  ContentRoom.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 3/5/24.
//

import Foundation

class ContentRoomDTO: Codable {
    let room: RoomDTO
    var stashes: [ContentStashDTO]
    var articles: [ArticleWithStockDTO]

    init(room: RoomDTO, stashes: [ContentStashDTO], articles: [ArticleWithStockDTO]) {
        self.room = room
        self.stashes = stashes
        self.articles = articles
    }
}
