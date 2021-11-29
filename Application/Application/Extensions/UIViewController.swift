//
//  UIViewController.swift
//  Application
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit

extension UIViewController {
    func enableKeyboardDismissing() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(resignKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func resignKeyboard() {
        view.endEditing(true)
    }
}
