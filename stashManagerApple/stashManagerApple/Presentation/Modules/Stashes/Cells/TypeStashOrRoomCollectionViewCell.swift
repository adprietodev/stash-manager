//
//  TypeStashOrRoomCollectionViewCell.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 4/5/24.
//

import UIKit

class TypeStashOrRoomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var typeStashOrRoomNameLabel: UILabel!
    @IBOutlet weak var typeStashOrRoomNameView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Functions
    func setupCell(with name: String) {
        typeStashOrRoomNameView.backgroundColor = .skyBlue
        typeStashOrRoomNameLabel.text = name
        typeStashOrRoomNameLabel.textColor = .prussianBlue
        typeStashOrRoomNameLabel.font = UIFont().robotoRegular(with: 14)
        typeStashOrRoomNameView.layer.cornerRadius = 16
    }
}
