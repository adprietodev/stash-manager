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
    @IBOutlet weak var stashesCollectionView: UICollectionView!
    @IBOutlet weak var searcherImageView: UIImageView!

    // MARK: - Properties
    var viewModel: StashesViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
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

    // MARK: - IBActions
    @IBAction func filterStashByName(_ sender: Any) {
        viewModel.isFiltering = viewModel.isFilterStashes(by: searchTextField.text ?? "")
        stashesCollectionView.reloadData()
    }

    // MARK: - Functions
    func configurationView() {
        self.navigationItem.title = "STASHES"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(goToAddStash))
        rightAddRoomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue

        searchView.layer.cornerRadius = 8
        searchTextField.font = UIFont().robotoRegular(with: 14)
        searcherImageView.tintColor = .prussianBlue
    }

    @objc func goToAddStash() {
        viewModel.goToAddStash()
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
                stashesCollectionView.reloadData()
            }
        }
    }
}

extension StashesViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.isFiltering ?  viewModel.filteredStashes.count : viewModel.stashes.count
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = stashesCollectionView.dequeueReusableCell(withReuseIdentifier: "StashCollectionViewCell", for: indexPath) as! StashCollectionViewCell
        if viewModel.isFiltering{
            let stashName = viewModel.filteredStashes[indexPath.row].name
            let stashImage = viewModel.filteredStashes[indexPath.row].base64image
            cell.setupCell(at: stashName, with: stashImage)
        } else {
            let stashName = viewModel.stashes[indexPath.row].name
            let stashImage = viewModel.stashes[indexPath.row].base64image
            cell.setupCell(at: stashName, with: stashImage)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let stash = viewModel.isFiltering ? viewModel.filteredStashes[indexPath.row] : viewModel.stashes[indexPath.row]
        viewModel.goToDetail(stash: stash)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 16, height: 112)
    }
}
