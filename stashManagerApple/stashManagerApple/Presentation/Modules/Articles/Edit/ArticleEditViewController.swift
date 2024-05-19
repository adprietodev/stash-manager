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
    // MARK: - Properties
    var viewModel: ArticleEditViewModelProtocol!
    let customImagePickerManager = CustomImagePickerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setCurrentType()
        configurationNavigationBar()
        configureView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    // MARK: - IBActions
    @IBAction func changeType(_ sender: Any) {
        viewModel.typeButtonPressed = .type
        viewModel.showCustomPickerType()
    }

    @IBAction func changeNameArticle(_ sender: Any) {
        guard let name = articleNameTextField.text else { return }
        viewModel.setNameArticle(name)
    }
    
    @IBAction func saveEdit(_ sender: Any) {
        guard let nameArticle = articleNameTextField.text, !nameArticle.isEmpty,
              let description = articleDescriptionTextView.text, !description.isEmpty,
              let articleType = articleTypeTextField.text, !articleType.isEmpty else {
            showAlertForEmptyFields()
            return
        }
        viewModel.setDescription(articleDescriptionTextView.text)
        switch viewModel.typeAction {
        case .edit:
            viewModel.updateArticle()
        case .add:
            viewModel.addArticleUser()
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
                viewModel.article.base64image = base64String
                articleImageView.loadBase64(base64String)
            }
        }
    }

    // MARK: - Functions
    func configurationNavigationBar() {
        self.navigationItem.title = "articles".localized.uppercased()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue
    }

    func configureView() {
        if viewModel.article.base64image == "" {
            articleImageView.image =  UIImage(named: "placeholder-stash")
        } else {
            articleImageView.loadBase64(viewModel.article.base64image)
        }
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
    }

    func showAlertForEmptyFields() {
        let alert = UIAlertController(title: "Error", message: "Todos los campos deben estar llenos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ArticleEditViewController: CustomPickerViewControllerDelegate {
    func changeType(customPicker: UIPickerView, typeText: String) {
        switch viewModel.typeButtonPressed {
        case .type:
            articleTypeTextField.inputView = customPicker
            articleTypeTextField.text = typeText
            viewModel.setTypeArticle(typeText)
        default:
            break
        }
    }
}
