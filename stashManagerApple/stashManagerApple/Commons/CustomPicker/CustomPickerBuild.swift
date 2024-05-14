//
//  CustomPickerBuild.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 11/5/24.
//

import Foundation

class CustomPickerBuild {
    func buildType(typeScreen: TypesScreens, typeSelected: String, typeAction: TypeAction, typeButtonPressed: TypeButtonPressed) -> CustomPickerViewController {
        let viewController = CustomPickerViewController(nibName: "CustomPickerViewController", bundle: nil)
        let router = CustomPickerRouter(viewController: viewController)
        viewController.viewModel = CustomPickerViewModel(router: router, typeScreen: typeScreen, typeSelected: typeSelected, typeAction: typeAction, typeButtonPressed: typeButtonPressed)
        return viewController
    }

    func builRoom( typeScreen: TypesScreens, typeAction: TypeAction, rooms: [Room], typeButtonPressed: TypeButtonPressed, roomSelectedName: String) -> CustomPickerViewController{
        let viewController = CustomPickerViewController(nibName: "CustomPickerViewController", bundle: nil)
        let router = CustomPickerRouter(viewController: viewController)
        viewController.viewModel = CustomPickerViewModel(router: router, typeScreen: typeScreen, typeAction: typeAction, rooms: rooms, typeButtonPressed: typeButtonPressed, roomSelectedName: roomSelectedName)
        return viewController
    }

    func buildStash(typeScreen: TypesScreens, typeAction: TypeAction, stashes: [Stash], typeButtonPressed: TypeButtonPressed, stashSelectedName: String)  -> CustomPickerViewController{
        let viewController = CustomPickerViewController(nibName: "CustomPickerViewController", bundle: nil)
        let router = CustomPickerRouter(viewController: viewController)
        viewController.viewModel = CustomPickerViewModel(router: router, typeScreen: typeScreen, typeAction: typeAction, stashes: stashes, typeButtonPressed: typeButtonPressed, stashSelectedName: stashSelectedName)
        return viewController
    }
}
