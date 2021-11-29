//
//  DreamWritingPresenter.swift
//  Application
//
//  Created by Berkehan on 17.11.2021.
//

import Foundation
import Service
class DreamWritingPresenter {
    
    weak var view: DreamWritingView?
    weak var router: DreamWritingRouter?
    /// send button Click action from dreamWritingViewController
    func sendButtonClicked(dreamText: String, dreamTopic: String, isPending: Bool, createdDate: String) {
        if Globals.coinCount >= 1 {
            Globals.coinCount -= 1
            addDream(dream: Dream(dream: dreamText, dreamTopic: dreamTopic, isPending: isPending, createdDate: createdDate))
        }
    }
    
    /// this function adds  dream to the data base
    ///
    /// - dream:  gets a dream from  which containts dream text and dream topic
    func addDream(dream: Dream) {
        Globals.myDreams.append(dream)
    }
    
    func getCurrentDateAsString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
