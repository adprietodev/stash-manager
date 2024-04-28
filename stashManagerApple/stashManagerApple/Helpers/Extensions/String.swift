//
//  String.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation

extension String {
    func isValidMail() -> Bool {
        let emailValidationRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: self)
    }

    func isValidPassword() -> Bool {
        let passwordValidationRedex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\dd$@$!%*?&#]{8,}"
        let passwordValidationPredicate = NSPredicate(format: "SELF MATCHES %@", passwordValidationRedex)
        return passwordValidationPredicate.evaluate(with: self)
    }
}
