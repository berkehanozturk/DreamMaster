//
//  HomeScreenModule.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit

class HomeScreenModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(.home, HomeScreenViewController.self) else {
            fatalError("Couldn't iniatialize HomeScreenViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
