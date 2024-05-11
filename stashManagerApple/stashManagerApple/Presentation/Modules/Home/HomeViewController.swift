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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
        configurationCategoriesCollectionView()
        configurationRoomsCollectionView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.removeSelectedRoom()
        viewModel.getRoomsAndTypesRoom()
        setupBindings()
        self.tabBarController?.tabBar.isHidden = false
    }

    // MARK: - IBActions
    @IBAction func filterRoom(_ sender: Any) {
        viewModel.isFiltering = viewModel.isFilterRoom(by: searchTextField.text ?? "")
        roomsCollectionView.reloadData()
    }

    // MARK: - Functions
    func configurationView() {
        self.navigationItem.title = "HOME"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        rightAddRoomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue

        searchView.layer.cornerRadius = 8
        searchTextField.font = UIFont().robotoRegular(with: 14)
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

    func setupBindings() {
        viewModel.refreshCollectionView = {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                categoriesCollectionView.reloadData()
                roomsCollectionView.reloadData()
            }
        }
    }
}

// MARK: - Extensions
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return viewModel.typesRoom.count
        } else {
            let roomCount = viewModel.isFiltering ? viewModel.filteredRooms.count : viewModel.rooms.count
            return roomCount
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            let typeRoom = viewModel.typesRoom[indexPath.row]
            cell.setupCell(with: typeRoom.name)
            return cell
        } else {
            let cell = roomsCollectionView.dequeueReusableCell(withReuseIdentifier: "RoomsCollectionViewCell", for: indexPath) as! RoomsCollectionViewCell
            let room = viewModel.isFiltering ? viewModel.filteredRooms[indexPath.row] : viewModel.rooms[indexPath.row]
            cell.setupCell(at: room.name, with: room.base64image)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let room = viewModel.isFiltering ? viewModel.filteredRooms[indexPath.row] : viewModel.rooms[indexPath.row]
        viewModel.goToRoomDetail(room: room)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            let name = viewModel.typesRoom[indexPath.row]
            let nameLabelSize = (name.name as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont().robotoRegular(with: 14)])
            let width = nameLabelSize.width + 32
            return CGSize(width: width, height: 32)
        } else {
            return CGSize(width: collectionView.frame.width, height: 112)
        }
    }
}
