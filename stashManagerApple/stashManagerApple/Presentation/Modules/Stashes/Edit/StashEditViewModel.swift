//
//  StashEditViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import Foundation

class StashEditViewModel: StashEditViewModelProtocol {
    // MARK: - Properties
    var stash: Stash
    var typesStash: [TypeStash]
    var router: StashEditRouterProtocol
    var currentType: String = TypesStash.cabinet.rawValue

    init(router: StashEditRouterProtocol, stash: Stash, typesStash: [TypeStash]) {
        self.stash = stash
        self.typesStash = typesStash
        self.router = router
    }

    func setCurrentType() {
        guard let type = typesStash.filter({ $0.id == stash.idTypeStash }).first?.name.rawValue else { return }
        currentType = type
    }

    func showCustomPickerType() {
        router.showCustomPickerType(typeScreen: .stash, typeSelected: currentType)
    }
}
