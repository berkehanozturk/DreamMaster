//
//  SignUpViewController.swift
//  Application
//
//  Created by Berkehan on 13.11.2021.
//

import UIKit
import UIComponents
protocol SignUpRouter: AnyObject {
    
}

protocol SignUpView: AnyObject {
    
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
    
    let emailField = InputFieldControl(image: UIImage(named: "pencil"), placeHolder: Localizables.Signup.userEmail)
    let passwordField = InputFieldControl(image: UIImage(named: "eraser"), placeHolder: Localizables.Signup.password)
    let passwordFieldAgain = InputFieldControl(image: UIImage(named: "eraser"), placeHolder: Localizables.Signup.passwordAgain)

    override func viewDidLoad() {
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
    }
    
}

extension SignUpViewController: SignUpView {
    
}

extension SignUpViewController: SignUpRouter {
    
}
