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

class BaseViewController: UIViewController {
    var backButton: BackButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        enableKeyboardDismissing()
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
}
