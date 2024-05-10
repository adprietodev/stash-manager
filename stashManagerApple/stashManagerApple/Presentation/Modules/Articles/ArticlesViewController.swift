//
//  ArticlesViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class ArticlesViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searcherImageView: UIImageView!
    @IBOutlet weak var collectionSegmentControl: UISegmentedControl!
    @IBOutlet weak var allArticlesTittleLabel: UILabel!
    @IBOutlet weak var allArticlesTitleView: UIStackView!
    @IBOutlet weak var articlesCollectionView: UICollectionView!

    // MARK: - Properties
    var viewModel: ArticlesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
        configurationArticlesCollectionView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        collectionSegmentControl.selectedSegmentIndex = viewModel.currentSegmentSelected
        viewModel.getData()
        setupBindings()
        viewModel.goingIntoDetailOrEdit = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        if !viewModel.goingIntoDetailOrEdit {
            viewModel.clearSelectedRoomAndStash()
            viewModel.showAllArticles = false
        }
    }

    // MARK: - IBActions
    @IBAction func changeContainer(_ sender: Any) {
        viewModel.showAllArticles  = collectionSegmentControl.selectedSegmentIndex == 1 ? true : false
        viewModel.currentSegmentSelected = collectionSegmentControl.selectedSegmentIndex
        viewModel.getData()
    }

    // MARK: - Functions
    func configurationView() {
        self.navigationItem.title = "ARTICULOS"
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

    func checkIsInsideOfRoomOrStash() {
        collectionSegmentControl.isHidden = !viewModel.isSelectedRoom
        allArticlesTitleView.isHidden = viewModel.isSelectedRoom
        allArticlesTittleLabel.font = UIFont().robotoRegular(with: 14)
        allArticlesTittleLabel.textColor = .prussianBlue
        if viewModel.isSelectedRoom, !viewModel.isSelectedStash {
            collectionSegmentControl.setTitle("Habitación", forSegmentAt: 0)
        }
        if viewModel.isSelectedRoom, viewModel.isSelectedStash {
            collectionSegmentControl.setTitle("Stash", forSegmentAt: 0)
        }
    }

    func configurationArticlesCollectionView() {
        articlesCollectionView.delegate = self
        articlesCollectionView.dataSource = self
        articlesCollectionView.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticleCollectionViewCell")
    }

    func setupBindings() {
        viewModel.refreshCollectionView = {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                articlesCollectionView.reloadData()
                checkIsInsideOfRoomOrStash()
            }
        }
    }
}

extension ArticlesViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !viewModel.isSelectedRoom, !viewModel.isSelectedStash{
            return viewModel.userArticles.count
        } else {
            let count = viewModel.showAllArticles ? viewModel.userArticles.count : viewModel.articlesWithStock.count
            return count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = articlesCollectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as! ArticleCollectionViewCell
        if !viewModel.isSelectedRoom, !viewModel.isSelectedStash {
            let article = viewModel.userArticles[indexPath.row]
            cell.setupCell(article: article, delegate: viewModel as! ArticleDelegate, articleStock: 0, haveArticle: false)
        } else {
            if viewModel.showAllArticles {
                let article = viewModel.userArticles[indexPath.row]
                cell.setupCell(article: article, delegate: viewModel as! ArticleDelegate, articleStock: 0, haveArticle: false)
            } else {
                let articleWithStock = viewModel.articlesWithStock[indexPath.row]
                cell.setupCell(article: articleWithStock.article, delegate: viewModel as! ArticleDelegate, articleStock: articleWithStock.stock, haveArticle: true)
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !viewModel.isSelectedRoom, !viewModel.isSelectedStash {
            viewModel.goToDetail(article: viewModel.userArticles[indexPath.row], typesArticle: viewModel.typesArticle)
        } else {
            if viewModel.showAllArticles {
                viewModel.goToDetail(article: viewModel.userArticles[indexPath.row], typesArticle: viewModel.typesArticle)
            } else {
                viewModel.goToDetail(article: viewModel.articlesWithStock[indexPath.row].article, typesArticle: viewModel.typesArticle)
            } 
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 42)
    }
}
