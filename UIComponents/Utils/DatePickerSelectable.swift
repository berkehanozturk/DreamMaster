//
//  DatePickerSelectable.swift
//  UIComponents
//
//  Created by Berkehan on 13.12.2021.
//

import Foundation
import UIKit

public protocol DatePickerSelectable {
    
    func showDatePicker(title: String, completion: @escaping(Date?) -> Void)
}

public extension DatePickerSelectable where Self: UIViewController {
    
    func showDatePicker(title: String, completion: @escaping(Date?) -> Void) {
        let dateViewController = DatePickerViewController()
        dateViewController.titleLabel.text = title
        dateViewController.completion = completion
        present(dateViewController, animated: true, completion: nil)
    }
    
}
