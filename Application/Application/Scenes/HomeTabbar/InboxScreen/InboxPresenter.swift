//
//  InboxPresenter.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import Foundation
import Service
class InboxPresenter {
    
    weak var view: InboxView?
    weak var router: InboxRouter?
    
    private var dreams = [Dream]() {
        didSet {
            view?.checkForEmptyItems()
        }
    }
    
    func didLoad() {
        getAllDreams(seconds: 2)
        
    }
    
    func getAllDreams(seconds: Int) {
        view?.showLoader()
        let deadLine = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadLine) { [self] in
            view?.hideLoader()
            self.dreams = Globals.myDreams

        }
    }
    
    func getDreamCount() -> Int {
        return dreams.count
    }
    
    func getDreamAtIndexPathInPending(indexPath: IndexPath) -> Dream {
        let pendingDreams = dreams.filter { $0.isPending == true }
        return pendingDreams[indexPath.row]
    }
    
    func getDreamAtIndexPathInAnswered(indexPath: IndexPath) -> Dream {
        let answeredDreams = dreams.filter { $0.isPending == false }

        return answeredDreams[indexPath.row]
    }
    
    func getPendingDreamCount() -> Int {
        let pendingDreams = dreams.filter { $0.isPending == true }
        return pendingDreams.count
    }
    
    func getAnsweredDreamCount() -> Int {
        let answeredDreams = dreams.filter { $0.isPending == false }
        return answeredDreams.count

    }
    
}
