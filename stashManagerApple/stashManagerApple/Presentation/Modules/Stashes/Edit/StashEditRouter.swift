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

    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String) {
        let customPickerViewController = CustomPickerBuild().build(typeScreen: typeScreen, typeSelected: typeSelected)
        customPickerViewController.delegate = viewController
        customPickerViewController.modalPresentationStyle = .overCurrentContext
        viewController.navigationController?.present(customPickerViewController, animated: true)
    }
}
