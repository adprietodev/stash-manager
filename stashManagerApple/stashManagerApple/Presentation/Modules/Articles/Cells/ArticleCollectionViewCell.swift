//
//  ArticleCollectionViewCell.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import UIKit

protocol ArticleDelegate {
    func goToEditArticle(_ article: Article)
    func addArticleStock(_ article: Article)
    func checkIsSelectedRoom() -> Bool
    func removeArticleStock(_ article: Article)
    func alertToRemoveArticle(_ article: Article)
}

class ArticleCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var articleNameLabel: UILabel!
    @IBOutlet weak var articleStockLabel: UILabel!
    @IBOutlet weak var addOrRemoveImageView: UIImageView!
    @IBOutlet weak var editArticleImageView: UIImageView!
    @IBOutlet weak var removeArticleImageView: UIImageView!
    @IBOutlet weak var removeOrAddView: UIView!
    @IBOutlet weak var editView: UIView!

    // MARK: - Properties
    var delegate: ArticleDelegate?
    var haveArticle: Bool = false
    var article: Article!

    // MARK: - IBActions
    @IBAction func addOrRemoveStock(_ sender: Any) {
        if haveArticle {
            delegate?.removeArticleStock(article)
        } else {
            delegate?.addArticleStock(article)
        }
    }

    @IBAction func goToEditArticle(_ sender: Any) {
        delegate?.goToEditArticle(article)
    }

    @IBAction func removeArticle(_ sender: Any) {
        delegate?.alertToRemoveArticle(article)
    }

    // MARK: - Functions
    func setupCell(article: Article, delegate: ArticleDelegate, articleStock: Int, haveArticle: Bool) {
        self.delegate = delegate
        self.article = article
        articleNameLabel.text = article.name
        articleNameLabel.font = UIFont().robotoRegular(with: 12)
        articleNameLabel.textColor = .prussianBlue
        articleStockLabel.text = "\(articleStock)"
        articleStockLabel.font = UIFont().robotoRegular(with: 12)
        articleStockLabel.textColor = .prussianBlue
        self.haveArticle = haveArticle
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.selectiveYellow.cgColor
        addOrRemoveImageView.tintColor = haveArticle ? .selectiveYellow : .prussianBlue
        editArticleImageView.tintColor = .prussianBlue
        removeArticleImageView.tintColor = .utOrange
        addOrRemoveImageView.isHidden = !delegate.checkIsSelectedRoom()
        articleStockLabel.isHidden = !haveArticle
        addOrRemoveImageView.image = haveArticle ? UIImage(systemName: "minus") : UIImage(systemName: "plus")    }
}
