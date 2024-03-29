//
//  LoginViewController.swift
//  Application
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit
import UIComponents
import Core
protocol LoginRouter: AnyObject {
    func goToSignUpVc()
    func goToHomeVc()
}

protocol LoginView: BaseView {
    
}

class LoginViewController: BaseViewController {
    
    var presenter = LoginPresenter()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var fieldStackView: UIStackView!
    @IBOutlet weak var loginButton: DreamMasterButton! {
        didSet {
            loginButton.setTitle(Localizables.Login.login, for: .normal)
        }
    }
    
    @IBOutlet weak var screenLabel: UILabel! {
        didSet {
            screenLabel.text = Localizables.Login.login
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
    
    let emailField = InputFieldControl(image: UIImage(named: ImageNames.pencil), placeHolder: Localizables.Login.userEmail)
    let passwordField = InputFieldControl(image: UIImage(named: ImageNames.eraser), placeHolder: Localizables.Login.password)

    override func viewDidLoad() {
        enableKeyboardDismissing()
        super.viewDidLoad()
        setup()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)
    }

    private func setup() {
        registerForKeyboardNotifications(bottomConstraint: scrollViewBottomConstraint)
        fieldStackView.addArrangedSubview(emailField)
        fieldStackView.addArrangedSubview(passwordField)
        emailField.layoutIfNeeded()
        fieldStackView.spacing  = emailField.frame.height/1.5
        backButton?.isHidden = true
        passwordField.textField.isSecureTextEntry = true
        passwordField.textField.clearsOnBeginEditing = false

        emailField.validationRules = [EmailValidation(errorMessageBlock: { (_) in
            return "Invalid email format"

        }), MinMaxLengthValidation(min: 5, max: 200, errorMessageBlock: { (_) -> String in
            return "password 5 karakter ve 50 kararkter arası olmak zorunda"
        })]
        passwordField.validationRules = [
            MinMaxLengthValidation(min: 5, max: 50, errorMessageBlock: { (_) -> String in
                return "password 5 karakter ve 50 kararkter arası olmak zorunda"
            })]
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        presenter.loginButtonClicked()
        goToHomeVc()
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
    
    func goToHomeVc() {
        let homeTabbar =  HomeTabbarModule.initModule()
        navigationController?.pushViewController(homeTabbar, animated: true)
    }
}
