//
//  RoomsCollectionViewCell.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 26/4/24.
//

import UIKit

class RoomsCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var roomImageView: UIImageView!
    @IBOutlet weak var roomNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(at name: String, with base64: String) {
        if base64 == "" {
            roomImageView.image =  UIImage(named: "placeholder-room")
        } else {
            roomImageView.loadBase64(base64)
        }
        roomNameLabel.text = name
        roomNameLabel.font = UIFont().robotoRegular(with: 14)
        self.layer.cornerRadius = 12
    }
}
