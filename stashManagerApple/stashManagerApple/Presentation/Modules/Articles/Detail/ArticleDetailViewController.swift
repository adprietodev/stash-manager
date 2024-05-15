//
//  ArticlesDetailViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleNameLabel: UILabel!
    @IBOutlet weak var articleTypeLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!

    // MARK: - Properties
    var viewModel: ArticleDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configurationNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    func configurationNavigationBar() {
        self.navigationItem.title = "article".localized
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(goToEdit))
        rightAddRoomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue
    }

    func configureView() {
        let article = viewModel.article
        if article.base64image == "" {
            articleImageView.image = UIImage(named: "placeholder-article")
        } else {
            articleImageView.loadBase64(article.base64image)
        }
        articleNameLabel.text = article.name
        articleNameLabel.font = UIFont().robotoRegular(with: 18)
        articleTypeLabel.text = viewModel.getTypeArticle().rawValue.localized
        articleTypeLabel.font = UIFont().robotoRegular(with: 18)
        descriptionTitleLabel.text = "description".localized
        descriptionTitleLabel.textColor = .blueGreen
        descriptionTitleLabel.font = UIFont().robotoRegular(with: 16)
        articleDescriptionLabel.text = article.description
        articleDescriptionLabel.font = UIFont().robotoRegular(with: 18)
    }

    @objc func goToEdit() {
        viewModel.goToEdit()
    }
}
