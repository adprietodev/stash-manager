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
        configurationView()
        configurationNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    // MARK: - Functions
    func configurationNavigationBar() {
        self.navigationItem.title = "HABITACIÓN"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: nil)
        rightAddRoomBarButton.tintColor = .prussianBlue
        self.navigationController?.navigationBar.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
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
        roomTypeLabel.text = type
        descriptionTitleLabel.text = "Descripción:"
        roomDescriptionLabel.text = room.description

        stashesView.layer.cornerRadius = 4
        articlesView.layer.cornerRadius = 4
        stashesButtonLabel.text = "STASHES"
        articlesButtonLabel.text = "ARTICULOS"
        stashesButtonLabel.font = UIFont().robotoBold(with: 16)
        articlesButtonLabel.font = UIFont().robotoBold(with: 16)
    }
}
