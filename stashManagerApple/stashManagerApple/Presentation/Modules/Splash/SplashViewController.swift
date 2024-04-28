//
//  SplashViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import UIKit

class SplashViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var splashIndicator: UIActivityIndicatorView!

    // MARK: - Properties
    var viewModel: SplashViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashIndicator.startAnimating()
    }
}
