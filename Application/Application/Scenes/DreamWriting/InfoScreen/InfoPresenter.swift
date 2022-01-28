//
//  InfoPresenter.swift
//  Application
//
//  Created by Berkehan on 13.12.2021.
//

import Foundation
import Core
import Service
enum Genders: String, CaseIterable {
    case man = "Man"
    case woman = "Woman"
  
    func getValue() -> String {
        switch self {
        case .man:
            return Localizables.InfoScreen.man
            
        case .woman:
            return Localizables.InfoScreen.woman
            
        }
    }
}

enum Jobs: String, CaseIterable {
    
    case houseWife = "Housewife"
    case privateSector = "Private Sector"
    case publicSector = "Public Sector"
    case lookingForAJob = "Looking for a Job"
    case student = "Student"
    case academician = "Academician"
    case retired = "Retired"
    case hasHerOwnJob = "Has her own Job"
    func getValue() -> String {
        switch self {
        case .houseWife:
            return Localizables.InfoScreen.houseWife

        case .privateSector:
            return Localizables.InfoScreen.privateSector

        case .publicSector:
            return Localizables.InfoScreen.publicSector

        case .lookingForAJob:
            return Localizables.InfoScreen.lookingForAJob

        case .student:
            return Localizables.InfoScreen.student

        case .academician:
            return Localizables.InfoScreen.academician

        case .retired:
            return Localizables.InfoScreen.retired

        case .hasHerOwnJob:
            return Localizables.InfoScreen.hasHerOwnJob

        }
    }
}

enum LoveTypes: String, CaseIterable {
    case notInaRelationShip = "Not in a relationship"
    case inaRelationship = "in a relationship"
    case platonic = "Platonic"
    case complicated = "Complicated"
    case inaCourtShip = "in a courtship"
    case engaged = "Engaged"
    case newlySeparated = "Newly seperated"
    case married = "Married"

    func getValue() -> String {
        switch self {
        case .notInaRelationShip:
            return Localizables.InfoScreen.notInaRelationShip
        case .inaRelationship:
            return Localizables.InfoScreen.inaRelationship
        case .platonic:
            return Localizables.InfoScreen.platonic
        case .complicated:
            return Localizables.InfoScreen.complicated
        case .inaCourtShip:
            return Localizables.InfoScreen.inaCourtShip
        case .engaged:
            return Localizables.InfoScreen.engaged
        case .newlySeparated:
            return Localizables.InfoScreen.newlySeparated
        case .married:
            return Localizables.InfoScreen.married

        }
    }
}

class InfoPresenter {
    
    weak var view: InfoView?
    weak var router: InfoRouter?
    var dreamText: String?
    var dreamTheme: String?
    var currenDateAsString: String?
    var pendingValue: Bool?
    var isPsychological: Bool?
    var isReligous: Bool?
    func resignAllResponder() {
        view?.resignAllResponder()
    }
    
    func getGenderArray() -> [Genders.RawValue] {
        let values: [String] = Genders.allCases.map { $0.getValue() }
        return values
    }
    
    func getJobArray() -> [Jobs.RawValue] {
        let values: [String] = Jobs.allCases.map { $0.getValue() }
        return values
    }
    
    func getLoveArray() -> [Jobs.RawValue] {
        let values: [String] = LoveTypes.allCases.map { $0.getValue() }
        return values
    }
    
    func setDreamText(dreamText: String) {
        self.dreamText = dreamText
    }
    
    func setDreamTheme(dreamTheme: String) {
        self.dreamTheme = dreamTheme

    }
    
    func setCurrentDate(currenDateAsString: String) {
        self.currenDateAsString = currenDateAsString

    }
    
    func setPendingValue(pendingValue: Bool) {
        self.pendingValue = pendingValue

    }
    
    func setIsPsychological(psychologicalFlag: Bool) {
        self.isPsychological = psychologicalFlag

    }
    
    func setIsReligous(religousFlag: Bool) {
        self.isReligous = religousFlag

    }
    
    func getDreamText() -> String? {
        return dreamText
    }
    
    func getDreamTheme() -> String? {
        return dreamTheme
    }
    
    func getCurrentDateString() -> String? {
        return currenDateAsString
    }
    
    func getPendingValue() -> Bool? {
        return pendingValue
    }
    
    func getIsReligous() -> Bool? {
        return isReligous
    }
    
    func getIsPsychological() -> Bool? {
        return isPsychological
    }
    
    func sendButtonclicked(name: String, gender: String, job: String, love: String) {
        let result = view?.validateWithoutScrollView()
        switch result {
        case .invalid(let error):
            print(error)
             view?.showAlert(title: "Opss..", message: error, actions: nil)
             return
        default:
            print("def")
        }
        guard let userDream = getDreamText(),
              let topic = getDreamTheme(),
              let pending = getPendingValue(),
              let createDate = getCurrentDateString(),
              let isPsychological = getIsPsychological(),
              let isReligous = getIsReligous() else {return}
        let dream = Dream(dream: userDream,
                          dreamTopic: topic,
                          isPending: pending,
                          createdDate: createDate,
                          isPsychological: isPsychological,
                          isReligous: isReligous,
                          name: name,
                          jobType: job,
                          gender: gender,
                          love: love)
        print(dream)
        addDreamRequest(dream: dream)
    }
    
    func addDreamRequest(dream: Dream) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if Globals.coinCount >= 1 {
                Globals.myDreams.append(dream)
                Globals.coinCount -= 1
                self.router?.goToInbox()
            }
            
        }
      
    }
}
