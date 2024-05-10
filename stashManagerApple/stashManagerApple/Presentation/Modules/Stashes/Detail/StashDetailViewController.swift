//
//  StashesDetailViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import UIKit

class StashDetailViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var stashImageView: UIImageView!
    @IBOutlet weak var stashNameLabel: UILabel!
    @IBOutlet weak var stashTypeLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var stashDescriptionLabel: UILabel!
    @IBOutlet weak var articlesView: UIView!
    @IBOutlet weak var articlesStashButtonLabel: UILabel!

    // MARK: - Properties
    var viewModel: StashDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configurationNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        viewModel.isGoingToArticle = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.removeSelectedStash()
    }

    // MARK: - IBActions
    @IBAction func goToArticlesInStash(_ sender: Any) {
        viewModel.goToArticleInStash()
    }
    
    // MARK: - Funtions
    func configureView() {
        let stash = self.viewModel.stash
        if stash.base64image == "" {
            stashImageView.image = UIImage(named: "placeholder-stash")
        } else {
            stashImageView.loadBase64(stash.base64image)
        }
        stashNameLabel.text = stash.name
        stashNameLabel.font = UIFont().robotoRegular(with: 18)
        stashTypeLabel.text = viewModel.typesStash.filter { $0.id == stash.idTypeStash }.first?.name
        stashTypeLabel.font = UIFont().robotoRegular(with: 18)
        descriptionTitleLabel.text = "Descripción"
        descriptionTitleLabel.textColor = .blueGreen
        descriptionTitleLabel.font = UIFont().robotoRegular(with: 16)
        stashDescriptionLabel.text = stash.description
        stashDescriptionLabel.font = UIFont().robotoRegular(with: 18)

        articlesView.layer.cornerRadius = 4
        articlesStashButtonLabel.text = "ARTICULOS"
        articlesStashButtonLabel.font = UIFont().robotoBold(with: 16)
    }

    func configurationNavigationBar() {
        self.navigationItem.title = "STASH"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(goToEditStash))
        rightAddRoomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue
    }

    @objc func goToEditStash() {
        viewModel.goToEditStash()
    }
}
