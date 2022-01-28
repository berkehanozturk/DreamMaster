//
//  PickerSelectable.swift
//  UIComponents
//
//  Created by Berkehan on 13.12.2021.
//

import Foundation
import UIKit
public protocol PickerSelectable {
    func showPickerView(title: String,optionsArray: [String], completion: @escaping(String?) -> Void)
}

public extension PickerSelectable where Self: UIViewController {

    func showPickerView(title: String,optionsArray: [String],completion: @escaping(String?) -> Void) {
        let pickerViewController = PickerViewController()
        pickerViewController.titleLabel.text = title
        pickerViewController.options = optionsArray
        pickerViewController.completion = completion
        present(pickerViewController, animated: true, completion: nil)
    }
}
