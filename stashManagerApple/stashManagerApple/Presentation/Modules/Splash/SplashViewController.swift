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
        self.navigationController?.navigationBar.isHidden = true
        viewModel.chargeData()
    }

    func goToTabBar() {
        viewModel.finishLoad = {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                splashIndicator.stopAnimating()
            }
        }
    }
}
