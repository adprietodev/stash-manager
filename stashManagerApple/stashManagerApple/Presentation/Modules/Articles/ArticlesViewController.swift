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

    @IBAction func filterArticles(_ sender: Any) {
        viewModel.isFiltering = viewModel.isFilterArticle(by: searchTextField.text ?? "")
        articlesCollectionView.reloadData()
    }
    // MARK: - IBActions
    @IBAction func changeContainer(_ sender: Any) {
        viewModel.showAllArticles  = collectionSegmentControl.selectedSegmentIndex == 1 ? true : false
        viewModel.currentSegmentSelected = collectionSegmentControl.selectedSegmentIndex
        viewModel.getData()
    }

    // MARK: - Functions
    func configurationView() {
        self.navigationItem.title = "articles".localized.uppercased()
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
            collectionSegmentControl.setTitle("room".localized, forSegmentAt: 0)
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
        if !viewModel.isSelectedRoom, !viewModel.isSelectedStash {
            return viewModel.isFiltering ? viewModel.filteredArticles.count : viewModel.userArticles.count
        } else {
            if viewModel.showAllArticles {
                return viewModel.isFiltering ? viewModel.filteredArticles.count : viewModel.userArticles.count
            } else {
                return viewModel.isFiltering ? viewModel.filteredArticlesWithStock.count : viewModel.articlesWithStock.count
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = articlesCollectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as! ArticleCollectionViewCell
        if !viewModel.isSelectedRoom, !viewModel.isSelectedStash {
            let article = viewModel.isFiltering ? viewModel.filteredArticles[indexPath.row] : viewModel.userArticles[indexPath.row]
            cell.setupCell(article: article, delegate: viewModel as! ArticleDelegate, articleStock: 0, haveArticle: false)
        } else {
            if viewModel.showAllArticles {
                let article = viewModel.isFiltering ? viewModel.filteredArticles[indexPath.row] : viewModel.userArticles[indexPath.row]
                cell.setupCell(article: article, delegate: viewModel as! ArticleDelegate, articleStock: 0, haveArticle: false)
            } else {
                let articleWithStock = viewModel.isFiltering ? viewModel.filteredArticlesWithStock[indexPath.row] : viewModel.articlesWithStock[indexPath.row]
                cell.setupCell(article: articleWithStock.article, delegate: viewModel as! ArticleDelegate, articleStock: articleWithStock.stock, haveArticle: true)
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !viewModel.isSelectedRoom, !viewModel.isSelectedStash {
            let article = viewModel.isFiltering ? viewModel.filteredArticles[indexPath.row] : viewModel.userArticles[indexPath.row]
            viewModel.goToDetail(article: article, typesArticle: viewModel.typesArticle)
        } else {
            if viewModel.showAllArticles {
                let article = viewModel.isFiltering ? viewModel.filteredArticles[indexPath.row] : viewModel.userArticles[indexPath.row]
                viewModel.goToDetail(article: article, typesArticle: viewModel.typesArticle)
            } else {
                let articleWithStock = viewModel.isFiltering ? viewModel.filteredArticlesWithStock[indexPath.row] : viewModel.articlesWithStock[indexPath.row]
                viewModel.goToDetail(article: articleWithStock.article, typesArticle: viewModel.typesArticle)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 42)
    }
}
