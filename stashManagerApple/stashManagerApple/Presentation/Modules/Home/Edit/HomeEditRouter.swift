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
    
    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String,typeAction: TypeAction, typeButtonPressed: TypeButtonPressed) {
        let customPickerViewController = CustomPickerBuild().buildType(typeScreen: typeScreen, typeSelected: typeSelected, typeAction: typeAction, typeButtonPressed: typeButtonPressed)
        customPickerViewController.delegate = viewController
        customPickerViewController.modalPresentationStyle = .overCurrentContext
        viewController.navigationController?.present(customPickerViewController, animated: true)
    }

    func finishEditOrAddRoom() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            viewController.navigationController?.popViewController(animated: true)
        }
    }

    func deleteRoom() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            viewController.navigationController?.popToRootViewController(animated: true)
        }
    }
}
