//
//  SignUpModule.swift
//  Application
//
//  Created by Berkehan on 13.11.2021.
//

import UIKit

class SignUpModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(.signUp, SignUpViewController.self) else {
            fatalError("Couldn't iniatialize SignUpViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
