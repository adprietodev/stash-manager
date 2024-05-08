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
    @IBOutlet weak var articleTypeLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionTextView: UITextView!
    @IBOutlet weak var saveEditView: UIView!
    @IBOutlet weak var saveEditLabel: UILabel!
    @IBOutlet weak var cancelEditView: UIView!
    @IBOutlet weak var cancelEditLabel: UILabel!

    // MARK: - Properties
    var viewModel: ArticleEditViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationNavigationBar()
        configureView()
    }

    // MARK: - IBActions
    @IBAction func cancelEdit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - Functions
    func configurationNavigationBar() {
        self.navigationItem.title = "ARTICULOS"
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
        nameTitleLabel.text = "Nombre:"
        nameTitleLabel.font = UIFont().robotoRegular(with: 14)
        nameTitleLabel.textColor = .blueGreen
        articleNameTextField.text = viewModel.article.name
        articleNameTextField.font = UIFont().robotoRegular(with: 16)
        typeTitleLabel.text = "Tipo:"
        typeTitleLabel.textColor = .blueGreen
        typeTitleLabel.font = UIFont().robotoRegular(with: 14)
        articleTypeLabel.text = viewModel.typesArticle.filter { $0.id == viewModel.article.idTypeArticle }.first?.name
        articleTypeLabel.font = UIFont().robotoRegular(with: 16)
        descriptionTitleLabel.text = "Descripción:"
        descriptionTitleLabel.font = UIFont().robotoRegular(with: 14)
        descriptionTitleLabel.textColor = .blueGreen
        articleDescriptionTextView.text = viewModel.article.description
        articleDescriptionTextView.font = UIFont().robotoRegular(with: 16)

        cancelEditView.layer.borderColor = UIColor.utOrange.cgColor
        cancelEditView.layer.cornerRadius = 4
        cancelEditView.layer.borderWidth = 1
        cancelEditLabel.text = "Cancelar"
        cancelEditLabel.font = UIFont().robotoBold(with: 20)
        cancelEditLabel.textColor = .utOrange

        saveEditView.layer.cornerRadius = 4
        saveEditView.backgroundColor = .prussianBlue
        saveEditLabel.text = "Guardar"
        saveEditLabel.font = UIFont().robotoBold(with: 20)
        saveEditLabel.textColor = .white
    }
}
