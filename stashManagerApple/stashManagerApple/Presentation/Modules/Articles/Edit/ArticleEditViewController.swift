//
//  ArticlesEditViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import UIKit

class ArticleEditViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var articleNameTextField: UITextField!
    @IBOutlet weak var typeTitleLabel: UILabel!
    @IBOutlet weak var articleTypeTextField: UITextField!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionTextView: UITextView!
    @IBOutlet weak var saveEditView: UIView!
    @IBOutlet weak var saveEditLabel: UILabel!
    @IBOutlet weak var cancelEditView: UIView!
    @IBOutlet weak var cancelEditLabel: UILabel!
    @IBOutlet weak var roomTitleLabel: UILabel!
    @IBOutlet weak var roomTextField: UITextField!
    @IBOutlet weak var stashTitleLabel: UILabel!
    @IBOutlet weak var stashTextField: UITextField!
    @IBOutlet weak var roomAndStashStackView: UIStackView!

    // MARK: - Properties
    var viewModel: ArticleEditViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setCurrentType()
        configurationNavigationBar()
        configureView()
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

    @IBAction func changeStash(_ sender: Any) {
        viewModel.typeButtonPressed = .stash
        viewModel.showCustomPickerStash()
    }

    @IBAction func cancelEdit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - Functions
    func configurationNavigationBar() {
        self.navigationItem.title = "articles".localized.uppercased()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: nil)
        rightAddRoomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue
    }

    func configureView() {
        if viewModel.article.base64image == "" {
            articleImageView.image =  UIImage(named: "placeholder-stash")
        } else {
            articleImageView.loadBase64(viewModel.article.base64image)
        }
        roomTitleLabel.text = "room".localized
        roomTitleLabel.font = UIFont().robotoRegular(with: 14)
        roomTitleLabel.textColor = .blueGreen
        roomTextField.text = viewModel.selectedRoom.name
        roomTextField.font = UIFont().robotoRegular(with: 16)
        stashTitleLabel.text = "Stash"
        stashTitleLabel.font = UIFont().robotoRegular(with: 14)
        stashTitleLabel.textColor = .blueGreen
        stashTextField.text = viewModel.selectedStash.name
        stashTextField.font = UIFont().robotoRegular(with: 16)
        nameTitleLabel.text = "name".localized
        nameTitleLabel.font = UIFont().robotoRegular(with: 14)
        nameTitleLabel.textColor = .blueGreen
        articleNameTextField.text = viewModel.article.name
        articleNameTextField.font = UIFont().robotoRegular(with: 16)
        typeTitleLabel.text = "type".localized
        typeTitleLabel.textColor = .blueGreen
        typeTitleLabel.font = UIFont().robotoRegular(with: 14)
        articleTypeTextField.text = viewModel.currentType.localized
        articleTypeTextField.font = UIFont().robotoRegular(with: 16)
        descriptionTitleLabel.text = "description".localized
        descriptionTitleLabel.font = UIFont().robotoRegular(with: 14)
        descriptionTitleLabel.textColor = .blueGreen
        articleDescriptionTextView.text = viewModel.article.description
        articleDescriptionTextView.font = UIFont().robotoRegular(with: 16)

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
        roomAndStashStackView.isHidden = viewModel.selectedRoom.id == 0
    }
}

extension ArticleEditViewController: CustomPickerViewControllerDelegate {
    func changeType(customPicker: UIPickerView, typeText: String) {
        switch viewModel.typeButtonPressed {
        case .type:
            articleTypeTextField.inputView = customPicker
            articleTypeTextField.text = typeText
        case .room:
            roomTextField.inputView = customPicker
            roomTextField.text = typeText
        case .stash:
            stashTextField.inputView = customPicker
            stashTextField.text = typeText
        case .none:
            break
        }
    }
}
