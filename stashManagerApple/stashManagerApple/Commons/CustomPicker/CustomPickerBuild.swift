//
//  CustomPickerBuild.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 11/5/24.
//

import Foundation

class CustomPickerBuild {
    func build(typeScreen: TypesScreens, typeSelected: String) -> CustomPickerViewController {
        let viewController = CustomPickerViewController(nibName: "CustomPickerViewController", bundle: nil)
        let router = CustomPickerRouter(viewController: viewController)
        viewController.viewModel = CustomPickerViewModel(router: router, typeScreen: typeScreen, typeSelected: typeSelected)
        return viewController
    }
}
