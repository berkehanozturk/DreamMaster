//
//  InboxModule.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit

class InboxModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.StoryboardName, InboxViewController.self) else {
            fatalError("Couldn't iniatialize InboxViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
