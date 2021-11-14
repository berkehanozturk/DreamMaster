//
//  LoginModule.swift
//  Application
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit

class LoginModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.login, LoginViewController.self) else {
            fatalError("Couldn't iniatialize LoginViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
