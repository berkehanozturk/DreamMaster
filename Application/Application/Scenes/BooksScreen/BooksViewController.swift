//
//  BooksViewController.swift
//  Application
//
//  Created by Berkehan on 24.11.2021.
//

import UIKit

protocol BooksRouter: AnyObject {
    
}

protocol BooksView: AnyObject {
    
}

class BooksViewController: BaseViewController {
    
    var presenter = BooksPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension BooksViewController: BooksView {
    
}

extension BooksViewController: BooksRouter {
    
}
