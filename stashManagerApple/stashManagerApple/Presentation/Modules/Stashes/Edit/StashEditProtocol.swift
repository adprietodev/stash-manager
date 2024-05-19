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
    var room: Room { get set }
    var typeAction: TypeAction { get set }
    var typeButtonPressed: TypeButtonPressed? { get set }
    func showCustomPickerType()
    func showCustomPickerRoom()
    func setCurrentType()
    func updateStash()
    func insertStash()
    func deleteStash()
    func setTypeStash(_ nameType: String)
    func setNameStash(_ nameStash: String)
    func setRoom(_ nameRoom: String)
}

protocol StashEditRouterProtocol {
    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String,typeAction: TypeAction, typeButtonPressed: TypeButtonPressed)
    func showCustomPickerRoom(typeScreen: TypesScreens, typeAction: TypeAction, rooms: [Room], typeButtonPressed: TypeButtonPressed, roomSelectedName: String)
    func finishToInserOrDeletetStash()
    func finisUpdateStash()
}
