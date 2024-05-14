//
//  HomeEditProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 7/5/24.
//

import Foundation

protocol HomeEditViewModelProtocol {
    var room: Room? { get set }
    var typesRoom: [TypeRoom] { get set }
    var currentType: String { get set }
    var typeAction: TypeAction { get set }
    func setCurrentType()
    func showCustomPickerType()
}

protocol HomeEditRouterProtocol {
    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String,typeAction: TypeAction, typeButtonPressed: TypeButtonPressed)
}
