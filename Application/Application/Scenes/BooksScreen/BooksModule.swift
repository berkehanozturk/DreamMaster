//
//  BooksModule.swift
//  Application
//
//  Created by Berkehan on 24.11.2021.
//

import UIKit

class BooksModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(.books, BooksViewController.self) else {
            fatalError("Couldn't iniatialize BooksViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
