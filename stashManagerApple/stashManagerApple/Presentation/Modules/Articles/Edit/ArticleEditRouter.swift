//
//  ArticleEditRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 13/5/24.
//

import Foundation

class ArticleEditRouter: ArticleEditRouterProtocol {
    let viewController: ArticleEditViewController

    init(viewController: ArticleEditViewController) {
        self.viewController = viewController
    }

    func showCustomPickerType(typeScreen: TypesScreens, typeSelected: String,typeAction: TypeAction, typeButtonPressed: TypeButtonPressed) {
        let customPickerViewController = CustomPickerBuild().buildType(typeScreen: typeScreen, typeSelected: typeSelected, typeAction: typeAction, typeButtonPressed: typeButtonPressed)
        customPickerViewController.delegate = viewController
        customPickerViewController.modalPresentationStyle = .overCurrentContext
        viewController.navigationController?.present(customPickerViewController, animated: true)
    }

    func showCustomPickerRoom(typeScreen: TypesScreens, typeAction: TypeAction, rooms: [Room], typeButtonPressed: TypeButtonPressed, roomSelectedName: String){
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let customPickerViewController = CustomPickerBuild().builRoom(typeScreen: typeScreen, typeAction: typeAction, rooms: rooms, typeButtonPressed: typeButtonPressed, roomSelectedName: roomSelectedName)
            customPickerViewController.delegate = viewController
            customPickerViewController.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.present(customPickerViewController, animated: true)
        }
    }

    func showCustomPickerStash(typeScreen: TypesScreens, typeAction: TypeAction, stashes: [Stash], typeButtonPressed: TypeButtonPressed, stashSelectedName: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let customPickerViewController = CustomPickerBuild().buildStash(typeScreen: typeScreen, typeAction: typeAction, stashes: stashes, typeButtonPressed: typeButtonPressed, stashSelectedName: stashSelectedName)
            customPickerViewController.delegate = viewController
            customPickerViewController.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.present(customPickerViewController, animated: true)
        }
    }
}
