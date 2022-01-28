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
        public static var dreams: String { return  "dreams".localize() }
        public static var topic: String { return  "topic".localize() }
        public static var describeDream: String { return  "describe_dream".localize() }
        public static var send: String { return  "send".localize() }
        public static var psychological: String { return  "psychological".localize() }
        public static var religous: String { return  "religous".localize() }
        public static var writeYourDream: String { return  "write_your_dream".localize() }

    }
    
    public struct InboxTabbar {
        public static var myDreams: String { return  "my_dreams".localize() }
        public static var pendingDreams: String { return  "pending_dreams".localize() }
    }
    
    public struct BooksScreen {
        public static var searchWords: String { return  "search_words".localize() }
        public static var wordList: String { return  "word_list".localize() }

    }
    
    public struct InfoScreen {
        public static var name: String { return  "name".localize() }
        public static var personalInfos: String { return  "personal_infos".localize() }

        public static var gender: String { return  "gender".localize() }
        public static var job: String { return  "job".localize() }
        public static var love: String { return  "love".localize() }

        public static var select: String { return  "select".localize() }
        public static var man: String { return  "man".localize() }
        public static var woman: String { return  "woman".localize() }
        public static var houseWife: String { return  "houseWife".localize() }
        public static var privateSector: String { return  "private_sector".localize() }
        public static var publicSector: String { return  "public_sector".localize() }
        public static var lookingForAJob: String { return  "looking_for_a_job".localize() }
        public static var student: String { return  "student".localize() }
        public static var academician: String { return  "academician".localize() }
        public static var retired: String { return  "retired".localize() }
        public static var hasHerOwnJob: String { return  "has_her_own_job".localize() }
        
        
        public static var notInaRelationShip: String { return  "not_relation".localize() }
        public static var inaRelationship: String { return  "in_relation".localize() }
        public static var platonic: String { return  "platonic".localize() }
        public static var complicated: String { return  "complicated".localize() }
        public static var inaCourtShip: String { return  "courtship".localize() }
        public static var engaged: String { return  "engaged".localize() }
        public static var newlySeparated: String { return  "newly_seperated".localize() }
        public static var married: String { return  "married".localize() }

        
        

    }
}

