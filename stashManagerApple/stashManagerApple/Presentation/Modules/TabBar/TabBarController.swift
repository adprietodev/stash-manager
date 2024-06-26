//
//  TabBarController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarView()
    }

    // MARK: - Functions
    func build() -> TabBarController {
        return self
    }

    private func configureTabBarView() {
        tabBar.backgroundColor = .prussianBlue
        let homeViewController = HomeBuilder().build()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let stashesViewController = StashesBuilder().build()
        let stashesNavigationController = UINavigationController(rootViewController: stashesViewController)
        let articlesViewController = ArticlesBuilder().build()
        let articlesNavigationController = UINavigationController(rootViewController: articlesViewController)
        let profileViewController = ProfileBuilder().build()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)

        let tabBarList = [homeNavigationController, stashesNavigationController, articlesNavigationController, profileNavigationController]
        self.setViewControllers(tabBarList, animated: true)

        guard let items = self.tabBar.items else { return }
        items[0].image = UIImage(systemName: "house")
        items[0].title = "home".localized
        items[1].image = UIImage(systemName: "shippingbox")
        items[1].title = "Stashes"
        items[2].image = UIImage(systemName: "puzzlepiece")
        items[2].title = "articles".localized
        items[3].image = UIImage(systemName: "person.crop.circle")
        items[3].title = "profile".localized

        self.tabBar.tintColor = .skyBlue
        self.tabBar.unselectedItemTintColor = .skyBlueFiftyPercent
        self.tabBar.itemPositioning = .centered
    }
}
