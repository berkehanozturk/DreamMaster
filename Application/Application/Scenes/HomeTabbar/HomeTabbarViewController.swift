//
//  HomeTabbarViewController.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit

protocol HomeTabbarRouter: AnyObject {
    
}

protocol HomeTabbarView: AnyObject {
    
}

class HomeTabbarViewController: BaseViewController {
    
    var presenter = HomeTabbarPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension HomeTabbarViewController: HomeTabbarView {
    
}

extension HomeTabbarViewController: HomeTabbarRouter {
    
}
