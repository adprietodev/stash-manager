//
//  ProfileViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileLastNameLabel: UILabel!
    @IBOutlet weak var profileTitleEmailLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    @IBOutlet weak var removeAccountButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var removeAccountLabel: UILabel!
    @IBOutlet weak var removeAccountView: UIView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var logoutLabel: UILabel!

    // MARK: - Properties
    var viewModel: ProfileViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        viewModel.loadUserData()
        setupBinding()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    // MARK: - Functions
    func configureNavigationBar() {
        self.navigationItem.title = "PROFILE"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(goToEdit))
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        rightAddRoomBarButton.tintColor = .prussianBlue
        self.navigationController?.navigationBar.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
    }

    func setupBinding() {
        viewModel.loadView = {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.configureView()
            }
        }
    }

    func configureView() {
        if let user = viewModel.user {
            profileImageView.loadBase64(user.base64image)
            profileImageView.layer.cornerRadius = profileImageView.frame.width/2

            profileNameLabel.text = user.name
            profileNameLabel.font = UIFont().robotoRegular(with: 16)
            profileNameLabel.textColor = .prussianBlue

            profileLastNameLabel.text = user.lastname
            profileLastNameLabel.font = UIFont().robotoRegular(with: 16)
            profileLastNameLabel.textColor = .prussianBlue

            profileTitleEmailLabel.text = "email".localized.uppercased()
            profileTitleEmailLabel.font = UIFont().robotoBold(with: 16)
            profileTitleEmailLabel.textColor = .prussianBlue

            profileEmailLabel.text = user.email
            profileEmailLabel.font = UIFont().robotoRegular(with: 16)
            profileEmailLabel.textColor = .prussianBlue

            removeAccountLabel.text = "delete_account".localized
            removeAccountLabel.font = UIFont().robotoBold(with: 18)
            removeAccountLabel.textColor = .utOrange
            removeAccountView.layer.borderWidth = 1
            removeAccountView.layer.borderColor = UIColor.utOrange.cgColor
            removeAccountView.layer.cornerRadius = 4

            logoutView.backgroundColor = .utOrange
            logoutView.layer.cornerRadius = 4
            logoutLabel.text = "logout".localized
            logoutLabel.font = UIFont().robotoBold(with: 18)
            logoutLabel.textColor = .white
        }
    }

    @objc func goToEdit() {
        viewModel.goToEditProfile()
    }
}
