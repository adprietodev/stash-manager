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
    var selectedRoom: Room { get set }
    var selectedStash: Stash { get set }
    var typeAction: TypeAction { get set }
    func showCustomPickerType()
    func setCurrentType() 
    func showCustomPickerRoom()
    func showCustomPickerStash()
}

protocol ArticleEditRouterProtocol {
    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String,typeAction: TypeAction, typeButtonPressed: TypeButtonPressed)
    func showCustomPickerRoom(typeScreen: TypesScreens, typeAction: TypeAction, rooms: [Room], typeButtonPressed: TypeButtonPressed, roomSelectedName: String)
    func showCustomPickerStash(typeScreen: TypesScreens, typeAction: TypeAction, stashes: [Stash], typeButtonPressed: TypeButtonPressed, stashSelectedName: String)
}
