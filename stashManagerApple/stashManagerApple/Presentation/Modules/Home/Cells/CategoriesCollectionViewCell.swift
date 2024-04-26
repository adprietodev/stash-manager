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

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Functions
    func setupCell(with name: String) {
        categoryView.backgroundColor = .skyBlue
        nameLabel.text = name
        nameLabel.textColor = .prussianBlue
        nameLabel.font = UIFont().montserratRegular(with: 14)
        categoryView.layer.cornerRadius = 14
        self.layer.cornerRadius = 14
        self.layer.borderWidth = 1.0
    }
}
