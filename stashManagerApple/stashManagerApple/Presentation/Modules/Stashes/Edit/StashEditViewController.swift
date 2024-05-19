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
    @IBOutlet weak var roomTitleLabel: UILabel!
    @IBOutlet weak var roomTextField: UITextField!
    
    // MARK: - Properties
    var viewModel: StashEditViewModelProtocol!
    var customImagePickerManager = CustomImagePickerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configurationNavigationBar()
        viewModel.setCurrentType()
    }

    // MARK: - IBActions
    @IBAction func changeType(_ sender: Any) {
        viewModel.typeButtonPressed = .type
        viewModel.showCustomPickerType()
    }

    @IBAction func changeRoom(_ sender: Any) {
        viewModel.typeButtonPressed = .room
        viewModel.showCustomPickerRoom()
    }

    @IBAction func changeName(_ sender: Any) {
        guard let nameStash = stashNameTextField.text else { return }
        viewModel.stash.name = nameStash
    }
    
    @IBAction func saveEdit(_ sender: Any) {
        guard let stashName = stashNameTextField.text, !stashName.isEmpty,
              let stashType = stashTypeTextField.text, !stashType.isEmpty,
              let stashNameRoom = roomTextField.text, !stashNameRoom.isEmpty,
              let stashDescription = stashDescriptionTextView.text, !stashDescription.isEmpty else { 
            showAlertForEmptyFields()
            return
        }
        switch viewModel.typeAction {
        case .edit:
            viewModel.stash.description = stashDescription
            viewModel.updateStash()
        case .add:
            viewModel.stash.description = stashDescription
            viewModel.insertStash()
        }
    }

    @IBAction func cancelEdit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func selectImage(_ sender: Any) {
        customImagePickerManager.pickImage(self) { [weak self] selectedImage in
            guard let self else { return }
            let resizedImage =  self.customImagePickerManager.resizeImage(image: selectedImage, targetSize: CGSize(width: 300, height: 300))
            if let imageData = resizedImage.pngData() {
                let base64String = imageData.base64EncodedString()
                viewModel.stash.base64image = base64String
                stashImageView.loadBase64(base64String)
            }
        }
    }

    // MARK: - Functions
    func showAlertForEmptyFields() {
        let alert = UIAlertController(title: "Error", message: "Todos los campos deben estar llenos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func configureView() {
        if viewModel.stash.base64image == "" {
            stashImageView.image =  UIImage(named: "placeholder-stash")
        } else {
            stashImageView.loadBase64(viewModel.stash.base64image)
        }
        roomTitleLabel.text = "room".localized
        roomTitleLabel.font = UIFont().robotoRegular(with: 14)
        roomTitleLabel.textColor = .blueGreen
        roomTextField.text = viewModel.room.name
        roomTextField.font = UIFont().robotoRegular(with: 16)
        roomTextField.textColor = .prussianBlue
        nameTitleLabel.text = "name".localized
        nameTitleLabel.font = UIFont().robotoRegular(with: 14)
        nameTitleLabel.textColor = .blueGreen
        stashNameTextField.text = viewModel.stash.name
        stashNameTextField.font = UIFont().robotoRegular(with: 16)
        stashNameTextField.textColor = .prussianBlue
        typeTitleLabel.text = "type".localized
        typeTitleLabel.textColor = .blueGreen
        typeTitleLabel.font = UIFont().robotoRegular(with: 14)
        stashTypeTextField.text = viewModel.typesStash.filter { $0.id == viewModel.stash.idTypeStash }.first?.name.rawValue.localized
        stashTypeTextField.font = UIFont().robotoRegular(with: 16)
        stashTypeTextField.textColor = .prussianBlue
        descriptionTitleLabel.text = "description".localized
        descriptionTitleLabel.font = UIFont().robotoRegular(with: 14)
        descriptionTitleLabel.textColor = .blueGreen
        stashDescriptionTextView.text = viewModel.stash.description
        stashDescriptionTextView.font = UIFont().robotoRegular(with: 16)
        stashDescriptionTextView.textColor = .prussianBlue

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
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "STASH"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = viewModel.typeAction == .edit ? UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(showDeleteConfirmationAlert)) : UIBarButtonItem(image: UIImage(systemName: ""), style: .plain, target: self, action: nil)
        rightAddRoomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue
    }

    @objc func showDeleteConfirmationAlert() {
        let alertController = UIAlertController(title: "Eliminar stash", message: "Estas apunto de eliminar el stash \(viewModel.stash.name)", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Eliminar", style: .destructive) { [weak self] _ in
            guard let self else { return }
            viewModel.deleteStash()
        }

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension StashEditViewController: CustomPickerViewControllerDelegate {
    func changeType(customPicker: UIPickerView, typeText: String) {
        switch viewModel.typeButtonPressed {
        case .type:
            stashTypeTextField.inputView = customPicker
            stashTypeTextField.text = typeText
            viewModel.setTypeStash(typeText)
        case .room:
            roomTextField.inputView = customPicker
            roomTextField.text = typeText
            viewModel.setRoom(typeText)
        case .stash:
            break
        case .none:
            break
        }
    }

}
