//
//  BookInformationModule.swift
//  Application
//
//  Created by Berkehan on 1.12.2021.
//

import UIKit

class BookInformationModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(.bookInformation, BookInformationViewController.self) else {
            fatalError("Couldn't iniatialize BookInformationViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
