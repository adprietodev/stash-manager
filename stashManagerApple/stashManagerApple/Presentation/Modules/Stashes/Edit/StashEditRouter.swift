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
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let customPickerViewController = CustomPickerBuild().buildType(typeScreen: typeScreen, typeSelected: typeSelected, typeAction: typeAction, typeButtonPressed: typeButtonPressed)
            customPickerViewController.delegate = viewController
            customPickerViewController.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.present(customPickerViewController, animated: true)
        }
    }

    func showCustomPickerRoom(typeScreen: TypesScreens, typeAction: TypeAction, rooms: [Room], typeButtonPressed: TypeButtonPressed, roomSelectedName: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let customPickerViewController = CustomPickerBuild().builRoom(typeScreen: typeScreen, typeAction: typeAction, rooms: rooms, typeButtonPressed: typeButtonPressed, roomSelectedName: roomSelectedName)
            customPickerViewController.delegate = viewController
            customPickerViewController.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.present(customPickerViewController, animated: true)
        }
    }

    func finishToInserOrDeletetStash()  {
        DispatchQueue.main.async { [weak self] in
            guard let self =  self else { return }
            viewController.navigationController?.popToRootViewController(animated: true)
        }
    }

    func finisUpdateStash() {
        DispatchQueue.main.async { [weak self] in
            guard let self =  self else { return }
            viewController.navigationController?.popViewController(animated: true)
        }
    }
    
}
