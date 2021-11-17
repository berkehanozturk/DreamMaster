//
//  HomeScreenViewController.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit

protocol HomeScreenRouter: AnyObject {
    
}

protocol HomeScreenView: AnyObject {
    
}

class HomeScreenViewController: BaseViewController {
    
    var presenter = HomeScreenPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension HomeScreenViewController: HomeScreenView {
    
}

extension HomeScreenViewController: HomeScreenRouter {
    
}
