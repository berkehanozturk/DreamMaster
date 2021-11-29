//
//  HomeScreenViewController.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit
import Core
import UIComponents
protocol HomeScreenRouter: AnyObject {
    func goToDreamWritingScreen()
    func goToBooksScreen()

}

protocol HomeScreenView: AnyObject {
    
}

class HomeScreenViewController: BaseViewController, UINavigationBarDelegate {
   
    var presenter = HomeScreenPresenter()
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    let booksView = DreamSelectionView(image: UIImage(named: ImageNames.ansik),
                                       title: SelectableTitleEnum.books,
                                       coinPrice: 0.0)
    let dreamView = DreamSelectionView(image: UIImage(named: ImageNames.fortuneTeller),
                                       title: SelectableTitleEnum.dreams,
                                       coinPrice: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)
        customizeNavbar()
        self.tabBarController?.tabBar.isHidden = false

    }
   
    private func setup() {
        mainStackView.addArrangedSubview(booksView)
        mainStackView.addArrangedSubview(dreamView)
        tabBarItem.title = Localizables.HomeTabbar.home
        dreamView.delegate = self
        booksView.delegate = self

    }
}
extension HomeScreenViewController: NavbarCustomizable, LeftNavbarViewDelegate {
    func leftBarButtonClicked() {
        self.tabBarController?.selectedIndex = 2
    }

    func customizeNavbar() {
        let leftNavbarCustomView = LeftNavbarView(image: UIImage(named: ImageNames.coin), goldTotal: Globals.coinCount)
        leftNavbarCustomView.leftNavbarViewDelegate = self
        leftNavbarCustomView.translatesAutoresizingMaskIntoConstraints = false
        let barButtonItem2 = UIBarButtonItem(customView: leftNavbarCustomView)
        navigationItem.leftBarButtonItem = barButtonItem2
        navigationController?.navigationBar.addSubview(leftNavbarCustomView)
        NSLayoutConstraint.activate([
            leftNavbarCustomView.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!),
            leftNavbarCustomView.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!),
            leftNavbarCustomView.heightAnchor.constraint(equalToConstant: 44),
            leftNavbarCustomView.trailingAnchor.constraint(equalTo: leftNavbarCustomView.goldLabel.trailingAnchor)
        ])
        navigationItem.title = "Dream Master"
    
    }
}
extension HomeScreenViewController: HomeScreenView {
    
}

extension HomeScreenViewController: HomeScreenRouter {
    func goToBooksScreen() {
        let booksVc =  BooksModule.initModule()
        navigationController?.pushViewController(booksVc, animated: true)
        self.tabBarController?.tabBar.isHidden = true

    }
    
    func goToDreamWritingScreen() {
        let dreamWritingVc =  DreamWritingModule.initModule()
        navigationController?.pushViewController(dreamWritingVc, animated: true)
        self.tabBarController?.tabBar.isHidden = true

    }
    
}

extension HomeScreenViewController: DreamSelectionDelegate {
    func dreamViewClicked(title: SelectableTitleEnum) {
        switch title {
        case .books:
            goToBooksScreen()
        case .dreams:
            goToDreamWritingScreen()

        }
    }
}
