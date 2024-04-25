//
//  HomeViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
    }

    // MARK: - Functions
    func configurationView() {
        self.navigationItem.title = "HOME"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().montserratBold(with: 24), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightCustomBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: nil, action: nil)
        rightCustomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightCustomBarButton
    }
}
