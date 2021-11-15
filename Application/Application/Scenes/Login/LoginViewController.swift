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
    @IBOutlet weak var loginButton: DreamMasterButton! {
        didSet {
            loginButton.setTitle(Localizables.Login.login, for: .normal)
        }
    }
    @IBOutlet weak var signUpLabel: UILabel! {
        didSet {
            let labelTap = UITapGestureRecognizer(target: self, action: #selector(labelClicked))
            signUpLabel.isUserInteractionEnabled = true
            signUpLabel.addGestureRecognizer(labelTap)
            let dontHaveAccountAttributedString = NSMutableAttributedString(string: Localizables.Login.dontHaveAccount)
            let blueAttribute = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
            let signupAtrributedString = NSAttributedString(string: Localizables.Signup.signup, attributes: blueAttribute)
            dontHaveAccountAttributedString.append(signupAtrributedString)
            signUpLabel.attributedText = dontHaveAccountAttributedString
        }
    }
    
    let emailField = InputFieldControl(image: UIImage(named: "pencil"), placeHolder: Localizables.Login.userEmail)
    let passwordField = InputFieldControl(image: UIImage(named: "eraser"), placeHolder: Localizables.Login.password)

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
