//
//  StashesEditViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import UIKit

class StashEditViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var stashImageView: UIImageView!
    @IBOutlet weak var saveEditView: UIView!
    @IBOutlet weak var saveEditLabel: UILabel!
    @IBOutlet weak var cancelEditView: UIView!
    @IBOutlet weak var cancelEditLabel: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var stashNameTextField: UITextField!
    @IBOutlet weak var typeTitleLabel: UILabel!
    @IBOutlet weak var stashTypeTextField: UITextField!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var stashDescriptionTextView: UITextView!

    // MARK: - Properties
    var viewModel: StashEditViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configurationNavigationBar()
        viewModel.setCurrentType()
    }

    // MARK: - IBActions
    @IBAction func changeType(_ sender: Any) {
        viewModel.showCustomPickerType()
    }

    @IBAction func saveEdit(_ sender: Any) {
    }

    @IBAction func cancelEdit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    func configureView() {
        if viewModel.stash.base64image == "" {
            stashImageView.image =  UIImage(named: "placeholder-stash")
        } else {
            stashImageView.loadBase64(viewModel.stash.base64image)
        }
        nameTitleLabel.text = "name".localized
        nameTitleLabel.font = UIFont().robotoRegular(with: 14)
        nameTitleLabel.textColor = .blueGreen
        stashNameTextField.text = viewModel.stash.name
        stashNameTextField.font = UIFont().robotoRegular(with: 16)
        typeTitleLabel.text = "type".localized
        typeTitleLabel.textColor = .blueGreen
        typeTitleLabel.font = UIFont().robotoRegular(with: 14)
        stashTypeTextField.text = viewModel.typesStash.filter { $0.id == viewModel.stash.idTypeStash }.first?.name.rawValue.localized
        stashTypeTextField.font = UIFont().robotoRegular(with: 16)
        descriptionTitleLabel.text = "description".localized
        descriptionTitleLabel.font = UIFont().robotoRegular(with: 14)
        descriptionTitleLabel.textColor = .blueGreen
        stashDescriptionTextView.text = viewModel.stash.description
        stashDescriptionTextView.font = UIFont().robotoRegular(with: 16)

        cancelEditView.layer.borderColor = UIColor.utOrange.cgColor
        cancelEditView.layer.cornerRadius = 4
        cancelEditView.layer.borderWidth = 1
        cancelEditLabel.text = "cancel".localized
        cancelEditLabel.font = UIFont().robotoBold(with: 20)
        cancelEditLabel.textColor = .utOrange

        saveEditView.layer.cornerRadius = 4
        saveEditView.backgroundColor = .prussianBlue
        saveEditLabel.text = "save".localized
        saveEditLabel.font = UIFont().robotoBold(with: 20)
        saveEditLabel.textColor = .white
    }

    func configurationNavigationBar() {
        self.navigationItem.title = "STASH"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: nil)
        rightAddRoomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue
    }
}

extension StashEditViewController: CustomPickerViewControllerDelegate {
    func changeType(customPicker: UIPickerView, typeText: String) {
        stashTypeTextField.inputView = customPicker
        stashTypeTextField.text = typeText
    }

}
