//
//  CustomPickerViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 11/5/24.
//

import Foundation

class CustomPickerViewModel: CustomPickerViewModelProtocol {
    // MARK: - Properties
    let router: CustomPickerRouterProtocol
    var typeScreen: TypesScreens
    var typeSelected:  String
    var typeArticleSelected: TypesArticle?
    var typeStashSelected: TypesStash?
    var typeRoomSelected: TypesRoom?
    let typesArticleArray: [TypesArticle] = [
        .electronics,
        .clothing,
        .food,
        .books,
        .home,
        .toys,
        .furniture,
        .sportingGoods,
        .cosmetics,
        .tools,
        .DIYTools,
        .spicesCondiments
    ]
    let typesRoomArray: [TypesRoom] = [
        .bedroom,
        .livingRoom,
        .kitchen,
        .bathroom,
        .diningRoom,
        .homeOffice,
        .guestRoom,
        .laundryRoom,
        .basement,
        .attic
    ]
    let typesStashArray: [TypesStash] = [
        .closet,
        .chestOfDrawers,
        .cabinet,
        .shelvingUnitWithDoors,
        .trunk,
        .storageCabinetWithBaskets,
        .storageCabinetWithDrawers,
        .mirroredWardrobe,
        .shoeStorageCabinet,
        .coffeeTableWithStorage,
        .displayCabinet,
        .TVStandWithStorage,
        .storageTower,
        .builtInWardrobe,
        .consoleTableWithDrawers,
        .kitchenCartWithStorage,
        .bookcaseWithDoors,
        .storageBoxWithLid,
        .deskWithDrawers,
        .bathroomCabinet
    ]

    init(router: CustomPickerRouterProtocol, typeScreen: TypesScreens, typeSelected: String) {
        self.router = router
        self.typeScreen = typeScreen
        self.typeSelected = typeSelected
        switch typeScreen {
        case .article:
            self.typeArticleSelected = TypesArticle(rawValue: typeSelected)
        case .room:
            self.typeRoomSelected = TypesRoom(rawValue: typeSelected)
        case .stash:
            self.typeStashSelected = TypesStash(rawValue: typeSelected)
        case .profile:
            return
        }
    }

    // MARK: - Functions
    func getTypes() -> [String] {
        switch typeScreen {
        case .article:
            return typesArticleArray.map { $0.rawValue.localized }
        case .room:
            return typesRoomArray.map { $0.rawValue.localized }
        case .stash:
            return typesStashArray.map { $0.rawValue.localized }
        case .profile:
            return []
        }
    }

    func getIndexSelected() -> Int {
        var position = 0
        for (index, type) in  getTypes().enumerated() {
            if type ==  typeSelected.localized {
                position = index
            }
        }
        return position
    }

    func exitCustomPicker() {
        router.exitCustomPicker()
    }
}
