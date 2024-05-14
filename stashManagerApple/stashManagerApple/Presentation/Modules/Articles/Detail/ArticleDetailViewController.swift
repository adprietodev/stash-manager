//
//  ArticlesDetailViewController.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 8/5/24.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleNameLabel: UILabel!
    @IBOutlet weak var articleTypeLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var weightView: UIStackView!
    @IBOutlet weak var weightTitleLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var brandView: UIStackView!
    @IBOutlet weak var brandTitleLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var colorView: UIStackView!
    @IBOutlet weak var colorTitleLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var materialView: UIStackView!
    @IBOutlet weak var materialTitleLabel: UILabel!
    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var isSpiceView: UIStackView!
    @IBOutlet weak var isSpiceTitleLabel: UILabel!
    @IBOutlet weak var isSpiceLabel: UILabel!
    @IBOutlet weak var isSpicyView: UIStackView!
    @IBOutlet weak var isSpicyTitleLabel: UILabel!
    @IBOutlet weak var isSpicyLabel: UILabel!
    @IBOutlet weak var expirationDateView: UIStackView!
    @IBOutlet weak var expirationDateTitleLabel: UILabel!
    @IBOutlet weak var expirationDateLabel: UILabel!

    // MARK: - Properties
    var viewModel: ArticleDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configurationNavigationBar()
        hiddenSpecialProperties()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    func configurationNavigationBar() {
        self.navigationItem.title = "article".localized
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont().robotoBold(with: 20), NSAttributedString.Key.foregroundColor: UIColor.prussianBlue ]
        let rightAddRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(goToEdit))
        rightAddRoomBarButton.tintColor = .prussianBlue
        navigationItem.rightBarButtonItem = rightAddRoomBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .prussianBlue
    }

    func configureView() {
        let article = viewModel.article
        if article.base64image == "" {
            articleImageView.image = UIImage(named: "placeholder-article")
        } else {
            articleImageView.loadBase64(article.base64image)
        }
        articleNameLabel.text = article.name
        articleNameLabel.font = UIFont().robotoRegular(with: 18)
        articleTypeLabel.text = viewModel.getTypeArticle().rawValue.localized
        articleTypeLabel.font = UIFont().robotoRegular(with: 18)
        descriptionTitleLabel.text = "description".localized
        descriptionTitleLabel.textColor = .blueGreen
        descriptionTitleLabel.font = UIFont().robotoRegular(with: 16)
        articleDescriptionLabel.text = article.description
        articleDescriptionLabel.font = UIFont().robotoRegular(with: 18)
    }

    func hiddenSpecialProperties() {
        weightView.isHidden = true
        brandView.isHidden = true
        colorView.isHidden = true
        materialView.isHidden = true
        expirationDateView.isHidden = true
        isSpiceView.isHidden = true
        isSpicyView.isHidden = true
    }

    func setSpecialPropertiesByType() {
        let typeArticle = viewModel.getTypeArticle()
        switch typeArticle {
        case .electronics, .clothing, .home, .toys, .furniture, .sportingGoods, .tools, .DIYTools:
            weightView.isHidden = false
            brandView.isHidden = false
            colorView.isHidden = false
            materialView.isHidden = false

            weightTitleLabel.text = "weight".localized
            weightTitleLabel.font = UIFont().robotoRegular(with: 14)
            weightTitleLabel.textColor = .blueGreen
            weightLabel.text = "\(viewModel.article.weight) /g"
            weightLabel.font = UIFont().robotoRegular(with: 16)
            weightLabel.textColor = .prussianBlue

            brandTitleLabel.text = "brand".localized
            brandTitleLabel.font = UIFont().robotoRegular(with: 14)
            brandTitleLabel.textColor = .blueGreen
            brandLabel.text = "\(viewModel.article.brand)"
            brandLabel.font = UIFont().robotoRegular(with: 16)
            brandLabel.textColor = .prussianBlue

            colorTitleLabel.text = "color".localized
            colorTitleLabel.font = UIFont().robotoRegular(with: 14)
            colorTitleLabel.textColor = .blueGreen
            colorLabel.text = "\(viewModel.article.color)"
            colorLabel.font = UIFont().robotoRegular(with: 16)
            colorLabel.textColor = .prussianBlue

            materialTitleLabel.text = "material".localized
            materialTitleLabel.font = UIFont().robotoRegular(with: 14)
            materialTitleLabel.textColor = .blueGreen
            materialLabel.text = "\(viewModel.article.material)"
            materialLabel.font = UIFont().robotoRegular(with: 16)
            materialLabel.textColor = .prussianBlue
        case .food:
            expirationDateView.isHidden = false
            weightView.isHidden = false
            isSpicyView.isHidden = false

            weightTitleLabel.text = "weight".localized
            weightTitleLabel.font = UIFont().robotoRegular(with: 14)
            weightTitleLabel.textColor = .blueGreen
            weightLabel.text = "\(viewModel.article.weight) /g"
            weightLabel.font = UIFont().robotoRegular(with: 16)
            weightLabel.textColor = .prussianBlue

            expirationDateTitleLabel.text = "expiration_date".localized
            expirationDateTitleLabel.font = UIFont().robotoRegular(with: 14)
            expirationDateTitleLabel.textColor = .blueGreen
            expirationDateLabel.text = "\(viewModel.article.expirationDate)"
            expirationDateLabel.font = UIFont().robotoRegular(with: 16)
            expirationDateLabel.textColor = .prussianBlue

            isSpicyTitleLabel.text = "spicy".localized
            isSpicyTitleLabel.font = UIFont().robotoRegular(with: 14)
            isSpicyTitleLabel.textColor = .blueGreen
            isSpicyLabel.text = "\(viewModel.article.isSpicy)"
            isSpicyLabel.font = UIFont().robotoRegular(with: 16)
            isSpicyLabel.textColor = .prussianBlue
        case .books:
            weightView.isHidden = false

            weightTitleLabel.text = "weight".localized
            weightTitleLabel.font = UIFont().robotoRegular(with: 14)
            weightTitleLabel.textColor = .blueGreen
            weightLabel.text = "\(viewModel.article.weight) /g"
            weightLabel.font = UIFont().robotoRegular(with: 16)
            weightLabel.textColor = .prussianBlue
        case .spicesCondiments:
            isSpiceView.isHidden = false
            isSpicyView.isHidden = false

            isSpiceTitleLabel.text = "spice".localized
            isSpiceTitleLabel.font = UIFont().robotoRegular(with: 14)
            isSpiceTitleLabel.textColor = .blueGreen
            isSpiceLabel.text = viewModel.article.isSpice ? "yes".localized : "no".localized
            isSpiceLabel.font = UIFont().robotoRegular(with: 16)
            isSpiceLabel.textColor = .prussianBlue

            isSpicyTitleLabel.text = "spicy".localized
            isSpicyTitleLabel.font = UIFont().robotoRegular(with: 14)
            isSpicyTitleLabel.textColor = .blueGreen
            isSpicyLabel.text = viewModel.article.isSpicy ? "yes".localized : "no".localized
            isSpicyLabel.font = UIFont().robotoRegular(with: 16)
            isSpicyLabel.textColor = .prussianBlue
        case .none: break
        case .cosmetics: break
        }
    }

    @objc func goToEdit() {
        viewModel.goToEdit()
    }
}
