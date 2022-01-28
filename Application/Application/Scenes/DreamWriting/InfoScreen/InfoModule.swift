//
//  InfoModule.swift
//  Application
//
//  Created by Berkehan on 13.12.2021.
//

import UIKit

class InfoModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(.info, InfoViewController.self) else {
            fatalError("Couldn't iniatialize InfoViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
