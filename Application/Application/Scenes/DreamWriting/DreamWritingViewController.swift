//
//  DreamWritingViewController.swift
//  Application
//
//  Created by Berkehan on 17.11.2021.
//

import UIKit
import UIComponents
import Core
protocol DreamWritingRouter: AnyObject {
    
}

protocol DreamWritingView: AnyObject {
    
}

class DreamWritingViewController: BaseViewController, DreamMasterButtonDelegate {
    func buttonClicked() {

        if dreamWriting.textField.text!.count < 1 {
            showAlert(title: "your Dream is too short", message: "rüyanızı 30 karakterden uzun olarak anlatmalısınız ", actions: nil)
        } else {
            guard let infoVc =  InfoModule.initModule() as? InfoViewController else {return}
            let dateString = presenter.getCurrentDateAsString()
            let dreamText =  dreamWriting.textField.text!
            let dreamThemeText = themeWriting.textField.text!

            infoVc.presenter.setDreamText(dreamText: dreamText)
            infoVc.presenter.setDreamTheme(dreamTheme: dreamThemeText)
            infoVc.presenter.setCurrentDate(currenDateAsString: dateString)
            infoVc.presenter.setIsPsychological(psychologicalFlag: psychologicalCheckFieldControl.isChecked)
            infoVc.presenter.setIsReligous(religousFlag: religiousCheckFieldControl.isChecked)
            present(infoVc, animated: true, completion: nil)

        }
    }
    
    var presenter = DreamWritingPresenter()
    @IBOutlet weak var containerStackView: UIStackView!
    
    @IBOutlet weak var scrollViewContainerView: UIView!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var screenLabel: UILabel! {
        didSet {
            screenLabel.text = Localizables.HomeTabbar.writeYourDream
        }
    }
    var sendButton = DreamMasterButton()
    let themeWriting = DreamFieldControl(image: UIImage(named: ImageNames.bookStack), placeHolder: Localizables.HomeTabbar.topic)
    let dreamWriting = DreamFieldControl(image: UIImage(named: ImageNames.topic), placeHolder: Localizables.HomeTabbar.describeDream)
    let topicImageView = UIImageView(image: UIImage(named: ImageNames.bookStack))
    let themeImageView = UIImageView(image: UIImage(named: ImageNames.topic))
    let topicContainerView = UIView()
    let themeContainerView = UIView()
    let selectionView = UIView()
    let buttonContainerView = UIView()
    let selectionContainerStack = UIStackView()
    
    let psychologicalCheckFieldControl = CheckBoxControl(descriptionText: Localizables.HomeTabbar.psychological)
    let religiousCheckFieldControl = CheckBoxControl(descriptionText: Localizables.HomeTabbar.religous)

    override func viewDidLoad() {
        enableKeyboardDismissing()
        super.viewDidLoad()
        registerForKeyboardNotifications(bottomConstraint: scrollViewBottomConstraint)
        // Do any additional setup after loading the view.
        setup()
        dreamWriting.delegate = self
        themeWriting.delegate = self
        sendButton.delegate = self
        setupLayout()
        setupStackViews()
       
        selectionView.addSubview(selectionContainerStack)
        topicContainerView.addSubview(topicImageView)
        themeContainerView.addSubview(themeImageView)
        buttonContainerView.addSubview(sendButton)
        sendButton.isEnabled = false

            NSLayoutConstraint.activate([
                topicContainerView.heightAnchor.constraint(equalToConstant: 30),
                themeContainerView.heightAnchor.constraint(equalToConstant: 40),
                buttonContainerView.heightAnchor.constraint(equalTo: scrollViewContainerView.heightAnchor, multiplier: 0.075),
                
                sendButton.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor, constant: 10),
                sendButton.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor, constant: -10),
                sendButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor),
                sendButton.bottomAnchor.constraint(equalTo: buttonContainerView.bottomAnchor),
                
                selectionView.heightAnchor.constraint(equalTo: scrollViewContainerView.heightAnchor, multiplier: 0.15),
                
                selectionContainerStack.topAnchor.constraint(equalTo: selectionView.topAnchor),
                selectionContainerStack.bottomAnchor.constraint(equalTo: selectionView.bottomAnchor),
                selectionContainerStack.leadingAnchor.constraint(equalTo: selectionView.leadingAnchor, constant: 10),
                selectionContainerStack.trailingAnchor.constraint(equalTo: selectionView.trailingAnchor, constant: -10),

                topicImageView.topAnchor.constraint(equalTo: topicContainerView.topAnchor),
                topicImageView.heightAnchor.constraint(equalToConstant: 30),
                topicImageView.widthAnchor.constraint(equalToConstant: 30),
                topicImageView.leadingAnchor.constraint(equalTo: topicContainerView.leadingAnchor, constant: 10),
                
                themeImageView.topAnchor.constraint(equalTo: themeContainerView.topAnchor),
                themeImageView.heightAnchor.constraint(equalToConstant: 50),
                themeImageView.widthAnchor.constraint(equalToConstant: 50),
                themeImageView.leadingAnchor.constraint(equalTo: themeContainerView.leadingAnchor, constant: 10),
                
                themeWriting.widthAnchor.constraint(equalTo: scrollViewContainerView.widthAnchor, multiplier: 1),
                themeWriting.heightAnchor.constraint(equalTo: scrollViewContainerView.heightAnchor, multiplier: 0.1),
                dreamWriting.widthAnchor.constraint(equalTo: scrollViewContainerView.widthAnchor, multiplier: 1),
                dreamWriting.heightAnchor.constraint(equalTo: scrollViewContainerView.heightAnchor, multiplier: 0.25)
              
            ])
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        view.layoutIfNeeded()
        containerStackView.layoutIfNeeded()
        scrollViewContainerView.layoutIfNeeded()

    }
    
    private func setup() {
        themeWriting.style = .dreamWriting
        dreamWriting.style = .dreamWriting

        containerStackView.spacing = 8
        containerStackView.distribution = .fill
        sendButton.style = .sendStyle
        sendButton.setTitle(Localizables.HomeTabbar.send, for: .normal)
        selectionView.backgroundColor = .clear
        buttonContainerView.backgroundColor = .clear
    }
    
    private func setupLayout() {
        scrollViewContainerView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContainerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        
        topicContainerView.translatesAutoresizingMaskIntoConstraints = false
        themeContainerView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        topicImageView.translatesAutoresizingMaskIntoConstraints = false
        themeImageView.translatesAutoresizingMaskIntoConstraints = false
        selectionView.translatesAutoresizingMaskIntoConstraints = false
        selectionContainerStack.translatesAutoresizingMaskIntoConstraints = false
        buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        themeWriting.translatesAutoresizingMaskIntoConstraints = false
        dreamWriting.translatesAutoresizingMaskIntoConstraints = false

    }
    
    private func setupStackViews() {
        selectionContainerStack.spacing = 5
        selectionContainerStack.distribution = .fillEqually
        selectionContainerStack.axis = .vertical
        selectionContainerStack.addArrangedSubview(psychologicalCheckFieldControl)
        selectionContainerStack.addArrangedSubview(religiousCheckFieldControl)
        
        containerStackView.addArrangedSubview(topicContainerView)
        containerStackView.addArrangedSubview(themeWriting)
        containerStackView.addArrangedSubview(themeContainerView)
        containerStackView.addArrangedSubview(dreamWriting)
        containerStackView.addArrangedSubview(selectionView)
        containerStackView.addArrangedSubview(buttonContainerView)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)
        customizeNavbar()
    }

}

extension DreamWritingViewController: DreamWritingView {
    
}

extension DreamWritingViewController: DreamWritingRouter {
    
}

extension DreamWritingViewController: NavbarCustomizable, LeftNavbarViewDelegate {
    func leftBarButtonClicked() {
        let infoVc =  InfoModule.initModule()
        navigationController?.modalPresentationStyle = .formSheet
        navigationController?.pushViewController(infoVc, animated: true)
       // present(infoVc, animated: true, completion: nil)
        
//        showAlert(title: "Emin misin", message: "1 coin karşılığında rüyanı yorumlatmaya  emin misin",
//                  actions: [UIAlertAction(title: "Ok", style: .default, handler: { [self] _ in
//                    let random = Int.random(in: 0...1)
//                    var isPending = true
//                    if random == 0 {
//                        isPending = false
//                    }
//                    let dateString = presenter.getCurrentDateAsString()
//                    presenter.sendButtonClicked(dreamText: dreamWriting.textField.text!,
//                                                dreamTopic: themeWriting.textField.text!,
//                                                isPending: isPending,
//                                                createdDate: dateString)
//                    navigationController?.popViewController(animated: true)
//        })])
    }

    func customizeNavbar() {
//        let leftNavbarCustomView = LeftNavbarView(customView: sendCustomView)
//        leftNavbarCustomView.leftNavbarViewDelegate = self
//        leftNavbarCustomView.translatesAutoresizingMaskIntoConstraints = false
//        let barButtonItem2 = UIBarButtonItem(customView: leftNavbarCustomView)
//        navigationItem.rightBarButtonItem = barButtonItem2
//        navigationItem.rightBarButtonItem?.isEnabled = false
//        navigationController?.navigationBar.addSubview(leftNavbarCustomView)
//        navigationController?.navigationBar.isUserInteractionEnabled = false
//        NSLayoutConstraint.activate([
//            leftNavbarCustomView.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!),
//            leftNavbarCustomView.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!),
//            leftNavbarCustomView.heightAnchor.constraint(equalToConstant: (navigationController?.navigationBar.frame.height ?? 44) * 0.7),
//            leftNavbarCustomView.widthAnchor.constraint(equalToConstant: (navigationController?.navigationBar.frame.height ?? 44) * 1.4)
//        ])
        navigationItem.backButtonTitle = ""

        navigationItem.title = "Dream Master"
    
    }
    
}
extension DreamWritingViewController: InputFieldControlDelegate {
    func textViewDidChanged() {
        if !dreamWriting.textField.text!.isEmpty && !themeWriting.textField.text!.isEmpty {
            sendButton.hideTransparentView()
            sendButton.isEnabled = true
        } else {
            sendButton.showTransparentView()
            sendButton.isEnabled = false
        }
    }
}
