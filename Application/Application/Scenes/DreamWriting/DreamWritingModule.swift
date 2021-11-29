//
//  DreamWritingModule.swift
//  Application
//
//  Created by Berkehan on 17.11.2021.
//

import UIKit

class DreamWritingModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(.dreamWriting, DreamWritingViewController.self) else {
            fatalError("Couldn't iniatialize DreamWritingViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
