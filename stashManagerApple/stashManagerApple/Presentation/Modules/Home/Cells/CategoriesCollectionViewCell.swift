//
//  CategoriesCollectionViewCell.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var nameLabel: UILabel!

    // MARK: - Properties

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Functions
    func setupCell(with name: String) {
        categoryView.backgroundColor = .skyBlue
        nameLabel.text = name
        nameLabel.textColor = .prussianBlue
        nameLabel.font = UIFont().robotoRegular(with: 14)
        categoryView.layer.cornerRadius = 16
    }
}
