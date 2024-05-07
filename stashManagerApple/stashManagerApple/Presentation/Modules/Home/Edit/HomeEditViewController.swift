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
    @IBOutlet weak var roomTypeLabel: UILabel!
    @IBOutlet weak var roomDescriptionTitleLabel: UILabel!
    @IBOutlet weak var roomDescriptionTextView: UITextView!
    @IBOutlet weak var cancelEditView: UIView!
    @IBOutlet weak var cancelEditLabel: UILabel!
    @IBOutlet weak var saveEditView: UIView!
    @IBOutlet weak var saveEditLabel: UILabel!

    // MARK: - Properties
    var viewModel: HomeEditViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationNavigationBar()
        configureView()
    }

    // MARK: - IBActions
    @IBAction func saveRoom(_ sender: Any) {
    }

    @IBAction func cancelEdit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - Functions
    func configurationNavigationBar() {
        self.navigationItem.title = "HABITACIÓN"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: nil)
        rightAddRoomBarButton.tintColor = .prussianBlue
        self.navigationController?.navigationBar.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
    }

    func configureView() {
        if let room =  viewModel.room {
            if room.base64image == "" {
                roomImageView.image =  UIImage(named: "placeholder-room")
            } else {
                roomImageView.loadBase64(room.base64image)
            }
        }
        roomNameTitleLabel.text = "Nombre:"
        roomNameTitleLabel.font = UIFont().robotoRegular(with: 14)
        roomNameTitleLabel.textColor = .blueGreen
        roomNameTextField.text = viewModel.room?.name
        roomNameTextField.font = UIFont().robotoRegular(with: 16)
        roomTypeTitleLabel.text = "Tipo:"
        roomTypeTitleLabel.textColor = .blueGreen
        roomTypeTitleLabel.font = UIFont().robotoRegular(with: 14)
        roomTypeLabel.text = viewModel.typesRoom?.filter { $0.id == viewModel.room?.idTypeRoom }.first?.name
        roomTypeLabel.font = UIFont().robotoRegular(with: 16)
        roomDescriptionTitleLabel.text = "Descripción:"
        roomDescriptionTitleLabel.font = UIFont().robotoRegular(with: 14)
        roomDescriptionTitleLabel.textColor = .blueGreen
        roomDescriptionTextView.text = viewModel.room?.description
        roomDescriptionTextView.font = UIFont().robotoRegular(with: 16)

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
