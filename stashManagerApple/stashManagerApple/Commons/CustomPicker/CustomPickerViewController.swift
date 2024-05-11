//
//  CustomPickerViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 11/5/24.
//

import UIKit

class CustomPickerViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var exitOutPickerButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var customPicker: UIPickerView!

    // MARK: - Properties
    var viewModel: CustomPickerViewModelProtocol!
    var delegate: CustomPickerViewControllerDelegate?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCustomPicker()
    }

    // MARK: - IBActions
    @IBAction func exitOutPicker(_ sender: Any) {
        viewModel.exitCustomPicker()
    }

    @IBAction func doneTypeSelected(_ sender: Any) {
        viewModel.exitCustomPicker()
    }

    // MARK: - Functions
    func configureView() {
        doneButton.titleLabel?.text = "done".localized
        doneButton.titleLabel?.font = UIFont().robotoRegular(with: 14)
    }

    func configureCustomPicker() {
        customPicker.delegate = self
        customPicker.dataSource = self
        customPicker.layer.shadowColor = UIColor.gray.cgColor
        customPicker.layer.shadowOpacity = 0.5
        customPicker.layer.shadowOffset = .zero
        customPicker.layer.shadowRadius = 10
        customPicker.selectRow(viewModel.getIndexSelected(), inComponent: 0, animated: false)
    }
}

extension CustomPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.getTypes().count
    }

    // swiftlint:disable:next identifier_name
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.getTypes()[row]
    }

    // swiftlint:disable:next identifier_name
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.changeType(customPicker: customPicker, typeText: viewModel.getTypes()[row])
    }
}
