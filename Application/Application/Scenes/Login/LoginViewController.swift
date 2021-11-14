//
//  LoginViewController.swift
//  Application
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit
import UIComponents
protocol LoginRouter: AnyObject {
    func goToSignUpVc()
}

protocol LoginView: AnyObject {
    
}

class LoginViewController: BaseViewController {
    
    var presenter = LoginPresenter()
    
    @IBOutlet weak var fieldStackView: UIStackView!
    @IBOutlet weak var loginButton: DreamMasterButton!
    @IBOutlet weak var signUpLabel: UILabel! {
        didSet {
            let labelTap = UITapGestureRecognizer(target: self, action: #selector(labelClicked))
            signUpLabel.isUserInteractionEnabled = true
            signUpLabel.addGestureRecognizer(labelTap)
        }
    }
    
    let emailField = InputFieldControl(image: UIImage(named: "pencil"), placeHolder: "Email")
    let passwordField = InputFieldControl(image: UIImage(named: "eraser"), placeHolder: "Password")

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)
    }
    
    private func setup() {
        fieldStackView.addArrangedSubview(emailField)
        fieldStackView.addArrangedSubview(passwordField)
        emailField.layoutIfNeeded()
        fieldStackView.spacing  = emailField.frame.height/1.5
        backButton?.isHidden = true

    }
 
    @IBAction func loginButtonClicked(_ sender: Any) {
        
    }
    
    @objc func labelClicked() {
        goToSignUpVc()
    }
}

extension LoginViewController: LoginView {
    
}

extension LoginViewController: LoginRouter {
    func goToSignUpVc() {
        let signUpVc =  SignUpModule.initModule()
        navigationController?.pushViewController(signUpVc, animated: true)
    }
    
}
