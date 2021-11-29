//
//  BaseViewController.swift
//  Application
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit
import UIComponents
protocol BaseRouter: AnyObject {
  
}

protocol BaseView: AnyObject {
    
}

class BaseViewController: UIViewController, Alertable {
    var backButton: BackButton?
    var bottomConstraintForKeyboard: NSLayoutConstraint?
    var keyboardHeight: CGFloat?
    var isBackButtonNeeded: Bool = false {
        didSet {
            if isBackButtonNeeded {
                backButton?.isHidden = false
            } else {
                backButton?.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        isBackButtonNeeded = false
    }
    
    private func setup() {
        backButton = BackButton()
        guard let backButton = backButton else {return}
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.05),
            backButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.05),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    func registerForKeyboardNotifications(bottomConstraint: NSLayoutConstraint) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow),
        name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide),
        name: UIResponder.keyboardWillHideNotification, object: nil)
        bottomConstraintForKeyboard = bottomConstraint
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardSize.height
            if let bottomConstraint = bottomConstraintForKeyboard {
                bottomConstraint.constant = -keyboardSize.height
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        if let bottomConstraint = bottomConstraintForKeyboard {
            bottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
