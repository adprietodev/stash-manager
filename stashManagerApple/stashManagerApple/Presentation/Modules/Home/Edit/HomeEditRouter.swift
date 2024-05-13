//
//  HomeEditRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 13/5/24.
//

import Foundation

class HomeEditRouter: HomeEditRouterProtocol {
    let viewController: HomeEditViewController
    
    init(viewController: HomeEditViewController) {
        self.viewController = viewController
    }
    
    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String) {
        let customPickerViewController = CustomPickerBuild().build(typeScreen: typeScreen, typeSelected: typeSelected)
        customPickerViewController.delegate = viewController
        customPickerViewController.modalPresentationStyle = .overCurrentContext
        viewController.navigationController?.present(customPickerViewController, animated: true)
    }
}
