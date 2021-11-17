//
//  StoreScreenViewController.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit
import UIComponents
import Core
protocol StoreScreenRouter: AnyObject {
    
}

protocol StoreScreenView: AnyObject {
    
}

class StoreScreenViewController: BaseViewController {
    
    var presenter = StoreScreenPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tabBarItem.title = Localizables.HomeTabbar.store
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)
        customizeNavbar()
    }
    
    private func setup() {
        self.view.backgroundColor = .yellow
    }
    
}

extension StoreScreenViewController: NavbarCustomizable, LeftNavbarViewDelegate {
    func leftBarButtonClicked() {
        self.tabBarController?.selectedIndex = 2

    }
    
    func customizeNavbar() {
        let leftNavbarCustomView = LeftNavbarView(image: UIImage(named: ImageNames.coin), goldTotal: Globals.coinCount)
        leftNavbarCustomView.leftNavbarViewDelegate = self
        leftNavbarCustomView.translatesAutoresizingMaskIntoConstraints = false
        let barButtonItem2 = UIBarButtonItem(customView: leftNavbarCustomView)
        self.navigationItem.leftBarButtonItem = barButtonItem2
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
extension StoreScreenViewController: StoreScreenView {
    
}

extension StoreScreenViewController: StoreScreenRouter {
    
}
