//
//  ArticleCollectionViewCell.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 6/5/24.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var articleNameLabel: UILabel!
    @IBOutlet weak var articleStockLabel: UILabel!
    @IBOutlet weak var addOrRemoveImageView: UIImageView!
    @IBOutlet weak var editArticleImageView: UIImageView!
    @IBOutlet weak var removeArticleImageView: UIImageView!

    // MARK: - Properties
    var haveArticle: Bool = false

    // MARK: - IBActions
    @IBAction func addOrRemoveStock(_ sender: Any) {
    }

    @IBAction func goToEditArticle(_ sender: Any) {
    }

    @IBAction func removeArticle(_ sender: Any) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Functions
    func setupCell(articleName: String, articleStock: Int, haveArticle: Bool) {
        articleNameLabel.text = articleName
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
        articleStockLabel.isHidden = !haveArticle
        addOrRemoveImageView.image = haveArticle ? UIImage(systemName: "minus") : UIImage(systemName: "plus")
    }
}
