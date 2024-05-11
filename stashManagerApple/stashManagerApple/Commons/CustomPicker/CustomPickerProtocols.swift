//
//  CustomPickerProtocols.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 11/5/24.
//

import UIKit

protocol CustomPickerViewModelProtocol {
    var typeSelected: String { get set }
    func getTypes() -> [String]
    func exitCustomPicker()
    func getIndexSelected() -> Int
}

protocol CustomPickerRouterProtocol {
    func exitCustomPicker()
}

protocol CustomPickerViewControllerDelegate {
    func changeType(customPicker: UIPickerView, typeText: String)
}
