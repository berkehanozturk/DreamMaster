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

class DreamWritingViewController: BaseViewController {
    
    var presenter = DreamWritingPresenter()
    @IBOutlet weak var containerStackView: UIStackView!
    
    @IBOutlet weak var scrollViewContainerView: UIView!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    let themeWriting = InputFieldControl(image: UIImage(named: ImageNames.bookStack), placeHolder: Localizables.HomeTabbar.topic)
    let dreamWriting = InputFieldControl(image: UIImage(named: ImageNames.topic), placeHolder: Localizables.HomeTabbar.describeDream)
    let topicImageView = UIImageView(image: UIImage(named: ImageNames.bookStack))
    let themeImageView = UIImageView(image: UIImage(named: ImageNames.topic))
    let topicContainerView = UIView()
    let themeContainerView = UIView()
    let sendCustomView = SendCustomView(title: "Send")

    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications(bottomConstraint: scrollViewBottomConstraint)
        // Do any additional setup after loading the view.
        setup()
        
        dreamWriting.delegate = self
        themeWriting.delegate = self
        
        scrollViewContainerView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContainerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - (keyboardHeight ?? 0)).isActive = true
        topicContainerView.translatesAutoresizingMaskIntoConstraints = false
        themeContainerView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        topicImageView.translatesAutoresizingMaskIntoConstraints = false
        themeImageView.translatesAutoresizingMaskIntoConstraints = false

        topicContainerView.addSubview(topicImageView)
        themeContainerView.addSubview(themeImageView)

        containerStackView.addArrangedSubview(topicContainerView)
        containerStackView.addArrangedSubview(themeWriting)
        containerStackView.addArrangedSubview(themeContainerView)
        containerStackView.addArrangedSubview(dreamWriting)
       // containerStackView.heightAnchor.constraint(equalTo: scrollViewContainerView.heightAnchor).isActive = true
        
        themeWriting.translatesAutoresizingMaskIntoConstraints = false
        dreamWriting.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
     
                topicContainerView.heightAnchor.constraint(equalToConstant: 30),
                themeContainerView.heightAnchor.constraint(equalToConstant: 50),
        
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
                dreamWriting.heightAnchor.constraint(equalTo: scrollViewContainerView.heightAnchor, multiplier: 0.7)
              
            ])
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        view.layoutIfNeeded()
        containerStackView.layoutIfNeeded()
        scrollViewContainerView.layoutIfNeeded()

    }
    
    private func setup() {
        themeWriting.style = .dreamWriting
        dreamWriting.style = .dreamWriting

        containerStackView.spacing = 5
        containerStackView.distribution = .fill
        themeWriting.textField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)
        customizeNavbar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setup()

    }
    
}

extension DreamWritingViewController: DreamWritingView {
    
}

extension DreamWritingViewController: DreamWritingRouter {
    
}

extension DreamWritingViewController: NavbarCustomizable, LeftNavbarViewDelegate {
    func leftBarButtonClicked() {
        showAlert(title: "Emin misin", message: "1 coin karşılığında rüyanı yorumlatmaya  emin misin",
                  actions: [UIAlertAction(title: "Ok", style: .default, handler: { [self] _ in
                    
                    let dateString = presenter.getCurrentDateAsString()
                    presenter.sendButtonClicked(dreamText: dreamWriting.textField.text!,
                                                dreamTopic: themeWriting.textField.text!,
                                                isPending: true,
                                                createdDate: dateString)
                    navigationController?.popViewController(animated: true)
        })])
    }

    func customizeNavbar() {
        let leftNavbarCustomView = LeftNavbarView(customView: sendCustomView)
        leftNavbarCustomView.leftNavbarViewDelegate = self
        leftNavbarCustomView.translatesAutoresizingMaskIntoConstraints = false
        let barButtonItem2 = UIBarButtonItem(customView: leftNavbarCustomView)
        navigationItem.rightBarButtonItem = barButtonItem2
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationController?.navigationBar.addSubview(leftNavbarCustomView)
        navigationController?.navigationBar.isUserInteractionEnabled = false
        NSLayoutConstraint.activate([
            leftNavbarCustomView.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!),
            leftNavbarCustomView.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!),
            leftNavbarCustomView.heightAnchor.constraint(equalToConstant: (navigationController?.navigationBar.frame.height ?? 44) * 0.7),
            leftNavbarCustomView.widthAnchor.constraint(equalToConstant: (navigationController?.navigationBar.frame.height ?? 44) * 1.4)
        ])
        navigationItem.title = "Dream Master"
    
    }
    
}
extension DreamWritingViewController: InputFieldControlDelegate {
    func textViewDidChanged() {
        if !dreamWriting.textField.text.isEmpty && !themeWriting.textField.text.isEmpty {
            sendCustomView.hideTransparentView()
            navigationItem.rightBarButtonItem?.isEnabled = true

        } else {
            sendCustomView.showTransparentView()
            navigationItem.rightBarButtonItem?.isEnabled = false

        }
    }
}
