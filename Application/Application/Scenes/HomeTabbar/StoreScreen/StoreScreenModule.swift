//
//  StoreScreenModule.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit

class StoreScreenModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.StoryboardName, StoreScreenViewController.self) else {
            fatalError("Couldn't iniatialize StoreScreenViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
