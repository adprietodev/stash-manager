//
//  LoginViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLogoLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lineEmailView: UIView!
    @IBOutlet weak var passwordTitleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var linePasswordView: UIView!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var signinLabel: UILabel!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var signinView: UIView!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!

    // MARK: - Properties
    var viewModel: LoginViewModelProtocol!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
    }

    // MARK: - IBActions
    @IBAction func loginAccess(_ sender: Any) {
        viewModel.goToTabBar()
    }

    // MARK: - Functions
    func configurationView() {
        titleLogoLabel.font = UIFont().montserratExtraBold(with: 16)
        titleLogoLabel.textColor = .prussianBlue
        emailView.layer.cornerRadius = 4
        emailView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        passwordView.layer.cornerRadius = 4
        passwordView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        emailTitleLabel.font = UIFont().montserratRegular(with: 12)
        emailTextField.font = UIFont().montserratRegular(with: 16)
        passwordTitleLabel.font = UIFont().montserratRegular(with: 12)
        passwordTextField.font = UIFont().montserratRegular(with: 16)
        forgotPasswordLabel.font = UIFont().montserratRegular(with: 12)
        forgotPasswordLabel.textColor = .blueGreen
        registerLabel.font = UIFont().montserratRegular(with: 12)
        registerLabel.textColor = .blueGreen
        signinView.layer.cornerRadius = signinButton.bounds.height/2
        signinLabel.font = UIFont().montserratBold(with: 14)
        signinLabel.text = "Iniciar sesión"
        errorEmailLabel.textColor = .red
        errorPasswordLabel.textColor = .red
        errorEmailLabel.font = UIFont().montserratRegular(with: 12)
        errorPasswordLabel.font = UIFont().montserratRegular(with: 12)
    }
}
