//
//  Localizables.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import Foundation
import Core
public struct Localizables {
    struct Login {
        static var login: String { return  "login".localize() }
        static var userEmail: String { return  "login_user_email".localize() }
        static var password: String { return "login_password".localize() }
        static var dontHaveAccount: String { return "dont_have_account".localize() }
    }
    
    struct Signup {
        static var signup: String { return  "signup".localize() }
        static var userEmail: String { return  "signup_user_email".localize() }
        static var password: String { return "signup_password".localize() }
        static var passwordAgain: String { return "signup_password_again".localize() }
    }
    
    struct HomeTabbar {
        static var home: String { return  "home".localize() }
        static var inbox: String { return  "inbox".localize() }
        static var store: String { return "store".localize() }
    }
    
    struct InboxTabbar {
        static var myDreams: String { return  "my_dreams".localize() }
        static var pendingDreams: String { return  "pending_dreams".localize() }
    }
}
