//
//  LoginPresenter.swift
//  Application
//
//  Created by Berkehan on 12.11.2021.
//

import Foundation

class LoginPresenter {
    
    weak var view: LoginView?
    weak var router: LoginRouter?
    
    func loginButtonClicked() {
        let result = view?.validate()
        switch result {
        case .invalid(let error):
         //   view?.showAlert(title: "Opss..", message: error, actions: nil)
             return
        default:
            print("def")
        }
    }
    
}
