//
//  StoreScreenViewController.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit

protocol StoreScreenRouter: AnyObject {
    
}

protocol StoreScreenView: AnyObject {
    
}

class StoreScreenViewController: BaseViewController {
    
    var presenter = StoreScreenPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension StoreScreenViewController: StoreScreenView {
    
}

extension StoreScreenViewController: StoreScreenRouter {
    
}
