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

    /// this function adds  dream to the data base
    ///
    /// - dream:  gets a dream from  which containts dream text and dream topic
    
    func getCurrentDateAsString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
