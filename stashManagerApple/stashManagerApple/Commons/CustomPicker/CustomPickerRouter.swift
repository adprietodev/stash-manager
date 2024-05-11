//
//  CustomPickerRouter.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 11/5/24.
//

import Foundation

class CustomPickerRouter: CustomPickerRouterProtocol {
    let viewController: CustomPickerViewController

    init(viewController: CustomPickerViewController) {
        self.viewController = viewController
    }

    func exitCustomPicker() {
        viewController.dismiss(animated: true)
    }
}
