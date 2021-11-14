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
    
    let emailField = InputFieldControl(image: UIImage(named: "pencil"), placeHolder: "Email")
    let passwordField = InputFieldControl(image: UIImage(named: "eraser"), placeHolder: "Password")
    let passwordFieldAgain = InputFieldControl(image: UIImage(named: "eraser"), placeHolder: "Password")

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
    }
    
}

extension SignUpViewController: SignUpView {
    
}

extension SignUpViewController: SignUpRouter {
    
}
