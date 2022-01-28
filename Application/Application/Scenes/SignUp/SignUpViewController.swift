//
//  SignUpViewController.swift
//  Application
//
//  Created by Berkehan on 13.11.2021.
//

import UIKit
import UIComponents
import Core
protocol SignUpRouter: AnyObject {
    
}

protocol SignUpView: BaseView {
    
}

class SignUpViewController: BaseViewController {
    
    var presenter = SignUpPresenter()
    
    @IBOutlet weak var fieldStackView: UIStackView!
    
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var signUpButton: DreamMasterButton! {
        didSet {
            signUpButton.setTitle(Localizables.Signup.signup, for: .normal)
        }
    }
    @IBOutlet weak var screenLabel: UILabel! {
        didSet {
            screenLabel.text = Localizables.Signup.signup
        }
    }
    
    let emailField = InputFieldControl(image: UIImage(named: ImageNames.pencil), placeHolder: Localizables.Signup.userEmail)
    let passwordField = InputFieldControl(image: UIImage(named: ImageNames.eraser), placeHolder: Localizables.Signup.password)
    let passwordFieldAgain = InputFieldControl(image: UIImage(named: ImageNames.eraser), placeHolder: Localizables.Signup.passwordAgain)

    override func viewDidLoad() {
        enableKeyboardDismissing()
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)
    }
    
    private func setup() {
        fieldStackView.addArrangedSubview(emailField)
        fieldStackView.addArrangedSubview(passwordField)
        fieldStackView.addArrangedSubview(passwordFieldAgain)
        emailField.layoutIfNeeded()
        fieldStackView.spacing  = emailField.frame.height/2.5
        registerForKeyboardNotifications(bottomConstraint: scrollViewBottomConstraint)
        isBackButtonNeeded = true
        
        emailField.validationRules = [EmailValidation(errorMessageBlock: { (_) in
            return "Invalid email format"

        })]
        passwordField.validationRules = [
            MinMaxLengthValidation(min: 5, max: 50, errorMessageBlock: { (_) -> String in
                return "password 5 karakter ve 50 kararkter arası olmak zorunda"

            }),
            SameInputValidation(inputText: passwordFieldAgain.textField.text!, shouldSame: true, errorMessageBlock: { (_) -> String in
            return "passwordlarınız aynı olmalı"
        })]
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        presenter.signUpButtonClicked()
    }
}

extension SignUpViewController: SignUpView {
    
}

extension SignUpViewController: SignUpRouter {
    
}
