//
//  InfoViewController.swift
//  Application
//
//  Created by Berkehan on 13.12.2021.
//

import UIKit
import Core
import UIComponents
protocol InfoRouter: AnyObject {
    func goToInbox()
}

protocol InfoView: BaseView {
    func resignAllResponder()
    func updateGenderField(string: String)
    func updateJobField(string: String)
    func updateLoveField(string: String)

}

class InfoViewController: BaseViewController, DatePickerSelectable, PickerSelectable, DreamMasterButtonDelegate {
    func buttonClicked() {
        let username = nameFieldControl.textField.text!
        let gender = genderField.dropDownField.label.text!
        let job = jobField.dropDownField.label.text!
        let love = loveField.dropDownField.label.text!
        let random = Int.random(in: 0...1)
        var isPending = true
        if random == 0 {
            isPending = false
        }
        presenter.setPendingValue(pendingValue: isPending)
        presenter.sendButtonclicked(name: username, gender: gender, job: job, love: love)
    }
    
    var presenter = InfoPresenter()
    @IBOutlet weak var screenLabel: UILabel! {
        didSet {
            screenLabel.text = Localizables.InfoScreen.personalInfos
        }
    }
    private let nameFieldControl = InputFieldControl(image: UIImage(named: ImageNames.pencil), placeHolder: Localizables.InfoScreen.name)
    private let genderField = DecriptionedView(descriptionText: Localizables.InfoScreen.gender)
    private let jobField = DecriptionedView(descriptionText: Localizables.InfoScreen.job)
    private let loveField = DecriptionedView(descriptionText: Localizables.InfoScreen.love)
    var sendButton = DreamMasterButton()

    @IBOutlet weak var mainStackView: UIStackView!
    override func viewDidLoad() {
        nameFieldControl.style = .noRadius
        enableKeyboardDismissing()
        super.viewDidLoad()
        setupStackView()
        setupGestures()
        sendButton.delegate = self
        sendButton.style = .sendStyle
        sendButton.hideTransparentView()
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.setTitle(Localizables.HomeTabbar.send, for: .normal)
        setup()
     
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        nameFieldControl.validationRules = [MinMaxLengthValidation(min: 1, errorMessageBlock: { (_) in
            return "name atleast bir karkter"
        })]
        
        genderField.validationRules = [RequiredValidation(errorMessageBlock: { (_) -> String in
            return "gender cant be empty"
        })]
        
        jobField.validationRules = [RequiredValidation(errorMessageBlock: { (_) -> String in
            return "jobs cant be empty"
        })]
        loveField.validationRules = [RequiredValidation(errorMessageBlock: { (_) -> String in
            return "love cant be empty"
        })]

    }
    
    private func setupGestures() {
        let genderTapGesture = UITapGestureRecognizer(target: self, action: #selector(genderClicked))
        let jobTapGesture = UITapGestureRecognizer(target: self, action: #selector(jobClicked))
        let loveTapGesture = UITapGestureRecognizer(target: self, action: #selector(loveClicked))
        
        genderField.addGestureRecognizer(genderTapGesture)
        jobField.addGestureRecognizer(jobTapGesture)
        loveField.addGestureRecognizer(loveTapGesture)
    }
    
    private func setupStackView() {
        nameFieldControl.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(nameFieldControl)
        NSLayoutConstraint.activate([
            nameFieldControl.heightAnchor.constraint(equalToConstant: 60),
            nameFieldControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95)
        ])
        mainStackView.addArrangedSubview(genderField)
        mainStackView.addArrangedSubview(jobField)
        mainStackView.addArrangedSubview(loveField)
        mainStackView.addArrangedSubview(sendButton)
    }
    
    @objc func genderClicked() {
        presenter.resignAllResponder()
        showPickerView(title: Localizables.InfoScreen.gender, optionsArray: presenter.getGenderArray()) { relationString in
            self.updateGenderField(string: relationString ?? Localizables.InfoScreen.select)
        }
    }
    
    @objc func jobClicked() {
        presenter.resignAllResponder()
        showPickerView(title: Localizables.InfoScreen.job, optionsArray: presenter.getJobArray()) { relationString in
            self.updateJobField(string: relationString ?? Localizables.InfoScreen.select)
        }
    }
    
    @objc func loveClicked() {
        presenter.resignAllResponder()
        showPickerView(title: Localizables.InfoScreen.love, optionsArray: presenter.getLoveArray()) { relationString in
            self.updateLoveField(string: relationString ?? Localizables.InfoScreen.select)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)
    }
    
}

extension InfoViewController: InfoView {
    func updateGenderField(string: String) {
        genderField.dropDownField.label.text = string

    }
    
    func updateJobField(string: String) {
        jobField.dropDownField.label.text = string

    }
    
    func updateLoveField(string: String) {
        loveField.dropDownField.label.text = string

    }
    
    func resignAllResponder() {
        view.endEditing(true)
    }
    
}

extension InfoViewController: InfoRouter {
    func goToInbox() {
        dismiss(animated: true) {
            let homeTabbar =  HomeTabbarModule.initModule()
            if let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                print(navController.viewControllers)
                navController.setViewControllers([homeTabbar], animated: true)
                let tabbar = homeTabbar as? UITabBarController
                tabbar?.selectedIndex = 1
            }
        }
    }
}
