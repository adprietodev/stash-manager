//
//  StashesViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class StashesViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var typeStashOrRoomCollectionView: UICollectionView!
    @IBOutlet weak var stashesCollectionView: UICollectionView!
    @IBOutlet weak var searcherImageView: UIImageView!

    // MARK: - Properties
    var viewModel: StashesViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
        configurationTypeStashOrRoomCollectionView()
        configurationStashesCollectionView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        setupBindings()
        viewModel.getData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        viewModel.checkSelectedStash()
    }

    // MARK: - Functions
    func configurationView() {
        self.navigationItem.title = "STASHES"
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

    func configurationTypeStashOrRoomCollectionView() {
        typeStashOrRoomCollectionView.dataSource = self
        typeStashOrRoomCollectionView.delegate = self
        typeStashOrRoomCollectionView.register(UINib(nibName: "TypeStashOrRoomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TypeStashOrRoomCollectionViewCell")
    }

    func configurationStashesCollectionView() {
        stashesCollectionView.delegate = self
        stashesCollectionView.dataSource = self
        stashesCollectionView.register(UINib(nibName: "StashCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StashCollectionViewCell")
    }

    func setupBindings() {
        viewModel.refreshCollectionView = {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                typeStashOrRoomCollectionView.reloadData()
                stashesCollectionView.reloadData()
            }
        }
    }
}

extension StashesViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == typeStashOrRoomCollectionView {
            if viewModel.isSelectedRoom {
                viewModel.typesStash.count
            } else {
                viewModel.contentsRoom.count
            }
        } else {
            if viewModel.isSelectedRoom {
                viewModel.selectedRoom!.stashes.count
            } else {
                viewModel.stashes.count
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == typeStashOrRoomCollectionView {
            let cell = typeStashOrRoomCollectionView.dequeueReusableCell(withReuseIdentifier: "TypeStashOrRoomCollectionViewCell", for: indexPath) as! TypeStashOrRoomCollectionViewCell
            if viewModel.isSelectedRoom {
                cell.setupCell(with: viewModel.typesStash[indexPath.row].name)
            } else {
                cell.setupCell(with: viewModel.contentsRoom[indexPath.row].room.name)
            }
            return cell
        } else {
            let cell = stashesCollectionView.dequeueReusableCell(withReuseIdentifier: "StashCollectionViewCell", for: indexPath) as! StashCollectionViewCell
            if viewModel.isSelectedRoom {
                let stashName = viewModel.selectedRoom!.stashes[indexPath.row].stash.name
                let stashImage = viewModel.selectedRoom!.stashes[indexPath.row].stash.base64image
                cell.setupCell(at: stashName, with: stashImage)
            } else {
                let stashName = viewModel.stashes[indexPath.row].name
                let stashImage = viewModel.stashes[indexPath.row].base64image
                cell.setupCell(at: stashName, with: stashImage)
            }
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.goToDetail(stash: viewModel.stashes[indexPath.row])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == typeStashOrRoomCollectionView {
            var name = ""
            if viewModel.isSelectedRoom {
                name = viewModel.typesStash[indexPath.row].name
            } else {
                name = viewModel.contentsRoom[indexPath.row].room.name
            }
            let nameLabelSize = (name as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont().robotoRegular(with: 14)])
            let width = nameLabelSize.width + 32
            return CGSize(width: width, height: 32)
        } else {
            return CGSize(width: collectionView.frame.width/2 - 16, height: 112)
        }
    }
}
