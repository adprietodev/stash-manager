//
//  ProfileEditViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 9/5/24.
//

import UIKit

class ProfileEditViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var mainUserImageView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var editOrChangeImageButton: UIButton!
    @IBOutlet weak var userNameTitleLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userLastnameTitleLabel: UILabel!
    @IBOutlet weak var userLastnameTextFiled: UITextField!
    @IBOutlet weak var userEmailTitleLabel: UILabel!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var saveEditLabel: UILabel!
    @IBOutlet weak var saveEditView: UIView!
    @IBOutlet weak var cancelEditLabel: UILabel!
    @IBOutlet weak var cancelEditView: UIView!

    // MARK: - Properties
    var viewModel: ProfileEditViewModelProtocol!
    let customImagePickerManager = CustomImagePickerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        configureView()
        configurationNavigationBar()
    }

    @IBAction func changeOrEditImageButtonView(_ sender: Any) {
        customImagePickerManager.pickImage(self) { [weak self] selectedImage in
            guard let self else { return }
            let resizedImage =  self.customImagePickerManager.resizeImage(image: selectedImage, targetSize: CGSize(width: 300, height: 300))
            if let imageData = resizedImage.pngData() {
                let base64String = imageData.base64EncodedString()
                viewModel.imageBase64 = base64String
                userImageView.loadBase64(base64String)
            }
        }
    }
    @IBAction func changeOrEditImageButtonText(_ sender: Any) {
        customImagePickerManager.pickImage(self) { [weak self] selectedImage in
            guard let self else { return }
            let resizedImage =  self.customImagePickerManager.resizeImage(image: selectedImage, targetSize: CGSize(width: 300, height: 300))
            if let imageData = resizedImage.pngData() {
                let base64String = imageData.base64EncodedString()
                viewModel.imageBase64 = base64String
                userImageView.loadBase64(base64String)
            }
        }
    }

    @IBAction func saveEdit(_ sender: Any) {
        guard let userName = userNameTextField.text, !userName.isEmpty,
              let userLastName = userLastnameTextFiled.text, !userLastName.isEmpty else {
                  showAlertForEmptyFields()
                  return
              }
        viewModel.editUser(nameUser: userName, lastName: userLastName)
    }
    
    @IBAction func cancelEdit(_ sender: Any) {
        viewModel.finishEditUser()
    }
    
    // MARK: - Functions
    func configureView() {
        mainUserImageView.layer.cornerRadius = mainUserImageView.frame.width/2
        if viewModel.user.base64image == "" {
            userImageView.image =  UIImage(named: "placeholder-user")
        } else {
            userImageView.loadBase64(viewModel.user.base64image)
        }
        editOrChangeImageButton.titleLabel?.text = "edit_or_change_photo"
        editOrChangeImageButton.titleLabel?.font = UIFont().robotoRegular(with: 12)

        userNameTitleLabel.text = "name".localized
        userNameTitleLabel.font = UIFont().robotoRegular(with: 12)
        userNameTitleLabel.textColor = .blueGreen
        userNameTextField.text = viewModel.user.name
        userNameTextField.font = UIFont().robotoRegular(with: 16)
        userNameTextField.textColor = .prussianBlue

        userLastnameTitleLabel.text = "lastname".localized
        userLastnameTitleLabel.font = UIFont().robotoRegular(with: 12)
        userLastnameTitleLabel.textColor = .blueGreen
        userLastnameTextFiled.text = viewModel.user.lastname
        userLastnameTextFiled.font = UIFont().robotoRegular(with: 16)
        userLastnameTextFiled.textColor = .prussianBlue

        userEmailTitleLabel.text = "email".localized
        userEmailTitleLabel.font = UIFont().robotoRegular(with: 12)
        userEmailTitleLabel.textColor = .blueGreen
        userEmailTextField.text = viewModel.user.email
        userEmailTextField.font = UIFont().robotoRegular(with: 16)
        userEmailTextField.textColor = .prussianBlue

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

    func showAlertForEmptyFields() {
        let alert = UIAlertController(title: "Error", message: "Todos los campos deben estar llenos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func configurationNavigationBar() {
        self.navigationItem.title = "profile".localized.uppercased()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue
    }
}
