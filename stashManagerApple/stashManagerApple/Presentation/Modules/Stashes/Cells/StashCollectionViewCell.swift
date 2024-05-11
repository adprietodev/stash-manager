//
//  StashCollectionViewCell.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 4/5/24.
//

import UIKit

class StashCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var stashImageView: UIImageView!
    @IBOutlet weak var stashNameLabel: UILabel!

    func setupCell(at name: String, with base64: String) {
        if base64 == "" {
            stashImageView.image =  UIImage(named: "placeholder-stash")
        } else {
            stashImageView.loadBase64(base64)
        }
        stashNameLabel.text = name
        stashNameLabel.font = UIFont().robotoRegular(with: 14)
        self.layer.cornerRadius = 12
    }
}
