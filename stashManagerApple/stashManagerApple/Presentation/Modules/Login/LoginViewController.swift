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
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lineEmailView: UIView!
    @IBOutlet weak var eyeImageView: UIImageView!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var passwordTitleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var linePasswordView: UIView!
    @IBOutlet weak var errorEmailLabel: UILabel!
    
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var signinLabel: UILabel!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var signinView: UIView!
    @IBOutlet weak var loginErrorView: UIView!
    @IBOutlet weak var loginErrorLabel: UILabel!

    // MARK: - Properties
    var viewModel: LoginViewModelProtocol!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
    }

    // MARK: - IBActions
    @IBAction func loginAccess(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        if email.isValidMail(), password.isValidPassword() {
            viewModel.login(with: email, at: password)
            setupBinding()
            lineEmailView.backgroundColor = email.isValidMail() ? .blueGreen : .red
            linePasswordView.backgroundColor = password.isValidPassword() ? .blueGreen : .red
        } else {
            loginErrorView.isHidden = true
            errorEmailLabel.isHidden = email.isValidMail()
            errorEmailLabel.text = email.isValidMail() ? "" : "Email no válido"
            lineEmailView.backgroundColor = email.isValidMail() ? .blueGreen : .red
            linePasswordView.backgroundColor = password.isValidPassword() ? .blueGreen : .red
        }
    }

    @IBAction func hiddeAndShowPassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        eyeImageView.image = passwordTextField.isSecureTextEntry ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash")
    }

    // MARK: - Functions
    func configurationView() {
        titleLogoLabel.font = UIFont().robotoBold(with: 16)
        titleLogoLabel.textColor = .prussianBlue
        emailTitleLabel.font = UIFont().robotoRegular(with: 12)
        emailTextField.font = UIFont().robotoRegular(with: 16)
        passwordTitleLabel.font = UIFont().robotoRegular(with: 12)
        passwordTextField.font = UIFont().robotoRegular(with: 16)
        forgotPasswordLabel.font = UIFont().robotoRegular(with: 12)
        forgotPasswordLabel.textColor = .blueGreen
        registerLabel.font = UIFont().robotoRegular(with: 12)
        registerLabel.textColor = .blueGreen
        signinView.layer.cornerRadius = 6
        signinLabel.font = UIFont().robotoBold(with: 14)
        signinLabel.text = "Iniciar sesión"
        errorEmailLabel.textColor = .red
        errorEmailLabel.font = UIFont().robotoRegular(with: 12)
        eyeImageView.tintColor = .prussianBlue
    }

    func setupBinding() {
        viewModel.loginError = {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                errorEmailLabel.isHidden = true
                loginErrorView.isHidden = false
                loginErrorLabel.textColor = .red
                loginErrorLabel.font = UIFont().robotoRegular(with: 12)
                loginErrorLabel.text = "Error de acceso por favor intentelo de nuevo"
            }
        }
    }
}
