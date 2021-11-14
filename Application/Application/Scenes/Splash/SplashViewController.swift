//
//  SplashViewController.swift
//  Application
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit

protocol SplashRouter: AnyObject {
}

protocol SplashView: AnyObject {
}

class SplashViewController: BaseViewController {
    var presenter = SplashPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
}

extension SplashViewController: SplashView {
    
}

extension SplashViewController: SplashRouter {
    
}
