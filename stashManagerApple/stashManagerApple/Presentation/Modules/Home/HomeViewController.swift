//
//  HomeViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var roomsCollectionView: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searcherImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
        configurationCategoriesCollectionView()
        configurationRoomsCollectionView()
    }

    // MARK: - Functions
    func configurationView() {
        self.navigationItem.title = "HOME"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().montserratBold(with: 24), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightCustomBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: nil, action: nil)
        rightCustomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightCustomBarButton

        searchView.layer.cornerRadius = 8
        searchTextField.font = UIFont().montserratRegular(with: 14)
        searcherImageView.tintColor = .prussianBlue
    }

    func configurationCategoriesCollectionView() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }

    func configurationRoomsCollectionView() {
        roomsCollectionView.delegate = self
        roomsCollectionView.dataSource = self
        roomsCollectionView.register(UINib(nibName: "RoomsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RoomsCollectionViewCell")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            cell.setupCell(with: "Hola")
            return cell
        } else {
            let cell = roomsCollectionView.dequeueReusableCell(withReuseIdentifier: "RoomsCollectionViewCell", for: indexPath)
            return cell
        }
    }
}
