//
//  HomeEditViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 7/5/24.
//

import UIKit

class HomeEditViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var roomImageView: UIImageView!
    @IBOutlet weak var roomImageEditButton: UIButton!
    @IBOutlet weak var roomNameTitleLabel: UILabel!
    @IBOutlet weak var roomNameTextField: UITextField!
    @IBOutlet weak var roomTypeTitleLabel: UILabel!
    @IBOutlet weak var roomTypeTextField: UITextField!
    @IBOutlet weak var roomDescriptionTitleLabel: UILabel!
    @IBOutlet weak var roomDescriptionTextView: UITextView!
    @IBOutlet weak var cancelEditView: UIView!
    @IBOutlet weak var cancelEditLabel: UILabel!
    @IBOutlet weak var saveEditView: UIView!
    @IBOutlet weak var saveEditLabel: UILabel!

    // MARK: - Properties
    var viewModel: HomeEditViewModelProtocol!
    var customImagePickerManager = CustomImagePickerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setCurrentType()
        configurationNavigationBar()
        configureView()
    }

    // MARK: - IBActions
    @IBAction func changeType(_ sender: Any) {
        viewModel.showCustomPickerType()
    }

    @IBAction func changeName(_ sender: Any) {
        viewModel.setNameRoom(roomNameTextField.text!)
    }

    @IBAction func saveRoom(_ sender: Any) {
        guard let nameRoom = roomNameTextField.text, !nameRoom.isEmpty,
              let descriptionName = roomDescriptionTextView.text, !descriptionName.isEmpty,
              let typeRoom = roomTypeTextField.text, !typeRoom.isEmpty else {
            showAlertForEmptyFields()
            return
        }
        switch viewModel.typeAction {
        case .edit:
            viewModel.room?.description = roomDescriptionTextView.text
            viewModel.updateRoom()
        case .add:
            viewModel.room?.description = roomDescriptionTextView.text
            viewModel.addRoom()
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
                viewModel.room?.base64image = base64String
                roomImageView.loadBase64(base64String)
            }
        }
    }

    // MARK: - Functions
    func configurationNavigationBar() {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "room".localized
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = viewModel.typeAction == .edit ? UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(showDeleteConfirmationAlert)) : UIBarButtonItem(image: UIImage(systemName: ""), style: .plain, target: self, action: nil)
        rightAddRoomBarButton.tintColor = .prussianBlue
        self.navigationController?.navigationBar.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
    }

    func showAlertForEmptyFields() {
        let alert = UIAlertController(title: "Error", message: "Todos los campos deben estar llenos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func configureView() {
        if viewModel.typeAction == .add {
            roomImageView.image =  UIImage(named: "placeholder-room")
        }

        if let room =  viewModel.room {
            if room.base64image == "" {
                roomImageView.image =  UIImage(named: "placeholder-room")
            } else {
                roomImageView.loadBase64(room.base64image)
            }
        }
        roomNameTitleLabel.text =  "name".localized
        roomNameTitleLabel.font = UIFont().robotoRegular(with: 14)
        roomNameTitleLabel.textColor = .blueGreen
        roomNameTextField.text = viewModel.typeAction == .edit ? viewModel.room?.name : ""
        roomNameTextField.font = UIFont().robotoRegular(with: 16)
        roomTypeTitleLabel.text = "type".localized
        roomTypeTitleLabel.textColor = .blueGreen
        roomTypeTitleLabel.font = UIFont().robotoRegular(with: 14)
        roomTypeTextField.text = viewModel.typeAction == .edit ? viewModel.currentType.localized : "none".localized
        roomTypeTextField.font = UIFont().robotoRegular(with: 16)
        roomDescriptionTitleLabel.text = "description".localized
        roomDescriptionTitleLabel.font = UIFont().robotoRegular(with: 14)
        roomDescriptionTitleLabel.textColor = .blueGreen
        roomDescriptionTextView.text = viewModel.typeAction == .edit ? viewModel.room?.description : ""
        roomDescriptionTextView.font = UIFont().robotoRegular(with: 16)

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

    @objc func showDeleteConfirmationAlert() {
        let alertController = UIAlertController(title: "Eliminar habitación", message: "Estas apunto de eliminar la habitación \(viewModel.room!.name)", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Eliminar", style: .destructive) { [weak self] _ in
            guard let self else { return }
            viewModel.deleteRoom()
        }

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension HomeEditViewController: CustomPickerViewControllerDelegate {
    func changeType(customPicker: UIPickerView, typeText: String) {
        roomTypeTextField.inputView = customPicker
        roomTypeTextField.text = typeText
        viewModel.setTypeRoom(typeText)
    }

}
