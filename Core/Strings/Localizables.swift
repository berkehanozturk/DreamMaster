//
//  Localizables.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import Foundation
public struct Localizables {
    public struct Login {
        public static var login: String { return  "login".localize() }
        public static var userEmail: String { return  "login_user_email".localize() }
        public static var password: String { return "login_password".localize() }
        public static var dontHaveAccount: String { return "dont_have_account".localize() }
    }
    
    public struct Signup {
        public  static var signup: String { return  "signup".localize() }
        public  static var userEmail: String { return  "signup_user_email".localize() }
        public  static var password: String { return "signup_password".localize() }
        public  static var passwordAgain: String { return "signup_password_again".localize() }
    }
    
    public struct HomeTabbar {
        public static var home: String { return  "home".localize() }
        public static var inbox: String { return  "inbox".localize() }
        public static var store: String { return "store".localize() }
        public static var books: String { return  "books".localize() }
        public static var dreams: String { return  "Dreams".localize() }
        public static var topic: String { return  "topic".localize() }
        public static var describeDream: String { return  "describe_dream".localize() }
        public static var send: String { return  "send".localize() }

    }
    
    public struct InboxTabbar {
        public static var myDreams: String { return  "my_dreams".localize() }
        public static var pendingDreams: String { return  "pending_dreams".localize() }
    }
    
    public struct BooksScreen {
        public static var searchWords: String { return  "search_words".localize() }
    }

}
