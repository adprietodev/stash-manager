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

    // MARK: - Properties
    var viewModel: HomeViewModelProtocol!

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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return viewModel.typesRoomMockUp.count
        } else {
            return viewModel.roomsMockUp.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            let typeRoom = viewModel.typesRoomMockUp[indexPath.row]
            cell.setupCell(with: typeRoom)
            return cell
        } else {
            let cell = roomsCollectionView.dequeueReusableCell(withReuseIdentifier: "RoomsCollectionViewCell", for: indexPath) as! RoomsCollectionViewCell
            let room =  viewModel.roomsMockUp[indexPath.row]
            cell.setupCell(at: room.name, with: room.imageBase64 ?? "")
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            let name = viewModel.typesRoomMockUp[indexPath.row]
            let nameLabelSize = (name as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont().montserratRegular(with: 14)])
            let width = nameLabelSize.width + 24
            return CGSize(width: width, height: 24)
        } else {
            return CGSize(width: collectionView.frame.width, height: 112)
        }
    }
}
