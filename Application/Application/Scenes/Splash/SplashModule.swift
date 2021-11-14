//
//  SplashModule.swift
//  Application
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit

class SplashModule {
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(.splash, SplashViewController.self) else {
            fatalError("Couldn't iniatialize SplashViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
}
