//
//  InboxViewController.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit

protocol InboxRouter: AnyObject {
    
}

protocol InboxView: AnyObject {
    
}

class InboxViewController: BaseViewController {
    
    var presenter = InboxPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension InboxViewController: InboxView {
    
}

extension InboxViewController: InboxRouter {
    
}
