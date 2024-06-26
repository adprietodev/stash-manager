//
//  HomeDetailViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import UIKit

class HomeDetailViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var roomImageView: UIImageView!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var roomTypeLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var roomDescriptionLabel: UILabel!
    @IBOutlet weak var stashesView: UIView!
    @IBOutlet weak var articlesView: UIView!
    @IBOutlet weak var stashesButtonLabel: UILabel!
    @IBOutlet weak var articlesButtonLabel: UILabel!

    // MARK: - Properties
    var viewModel: HomeDetailViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateRoom()
        configurationView()
        self.tabBarController?.tabBar.isHidden = true
    }

    // MARK: - IBActions
    @IBAction func goToStashesInRoom(_ sender: Any) {
        viewModel.goToStashesRoom()
    }

    @IBAction func goToArticlesInRoom(_ sender: Any) {
        viewModel.goToArticlesInRoom()
    }

    // MARK: - Functions
    func configurationNavigationBar() {
        self.navigationItem.title = "room".localized.uppercased()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(goToEditRoom))
        rightAddRoomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue
    }

    func configurationView() {
        let room =  viewModel.room
        let type =  viewModel.typesRoom.filter { $0.id == room.idTypeRoom }.first?.name
        if room.base64image == "" {
            roomImageView.image =  UIImage(named: "placeholder-room")
        } else {
            roomImageView.loadBase64(room.base64image)
        }
        roomNameLabel.text = room.name
        roomNameLabel.textColor = .prussianBlue
        roomTypeLabel.text = type?.rawValue.localized
        roomTypeLabel.textColor = .prussianBlue
        descriptionTitleLabel.text = "description".localized
        descriptionTitleLabel.font = UIFont().robotoRegular(with: 16)
        descriptionTitleLabel.textColor = .blueGreen
        roomDescriptionLabel.text = room.description
        roomDescriptionLabel.font = UIFont().robotoRegular(with: 16)
        roomDescriptionLabel.tintColor = .prussianBlue

        stashesView.layer.cornerRadius = 4
        articlesView.layer.cornerRadius = 4
        stashesButtonLabel.text = "STASHES"
        articlesButtonLabel.text = "articles".localized.uppercased()
        stashesButtonLabel.font = UIFont().robotoBold(with: 16)
        articlesButtonLabel.font = UIFont().robotoBold(with: 16)
    }

    @objc func goToEditRoom() {
        viewModel.goToEditRoom()
    }
}
