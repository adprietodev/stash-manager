//
//  StashEditProtocol.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

protocol StashEditViewModelProtocol {
    var stash: Stash { get set }
    var typesStash: [TypeStash] { get set }
    var currentType: String { get set }
    func showCustomPickerType()
    func setCurrentType()
}

protocol StashEditRouterProtocol {
    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String,typeAction: TypeAction, typeButtonPressed: TypeButtonPressed)
}
