//
//  SignUpPresenter.swift
//  Application
//
//  Created by Berkehan on 13.11.2021.
//

import Foundation

class SignUpPresenter {
    
    weak var view: SignUpView?
    weak var router: SignUpRouter?
    
    func signUpButtonClicked() {
        let result = view?.validate()
        switch result {
        case .invalid(let error):
          // view?.showAlert(title: "Opss..", message: error, actions: nil)
            return
        default:
            print("def")
        }
    }
}
