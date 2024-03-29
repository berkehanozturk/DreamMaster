//
//  HomeTabbarModule.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit

class HomeTabbarModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(.home, HomeTabbarViewController.self) else {
            fatalError("Couldn't iniatialize HomeTabbarViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
