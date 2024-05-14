//
//  StashEditRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 11/5/24.
//

import Foundation

class StashEditRouter: StashEditRouterProtocol {
    let viewController: StashEditViewController

    init(viewController: StashEditViewController) {
        self.viewController = viewController
    }

    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String,typeAction: TypeAction, typeButtonPressed: TypeButtonPressed) {
        let customPickerViewController = CustomPickerBuild().buildType(typeScreen: typeScreen, typeSelected: typeSelected, typeAction: typeAction, typeButtonPressed: typeButtonPressed)
        customPickerViewController.delegate = viewController
        customPickerViewController.modalPresentationStyle = .overCurrentContext
        viewController.navigationController?.present(customPickerViewController, animated: true)
    }
}
