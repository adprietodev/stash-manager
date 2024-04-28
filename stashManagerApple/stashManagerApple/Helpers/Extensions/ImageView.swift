//
//  Image.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import UIKit

extension UIImageView {
    func loadBase64(_ base64: String) {
        DispatchQueue.global().async { [ weak self] in
            guard let self = self else { return }
            if let data = Data(base64Encoded: base64, options: .ignoreUnknownCharacters) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
