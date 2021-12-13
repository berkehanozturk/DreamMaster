//
//  BookInformationPresenter.swift
//  Application
//
//  Created by Berkehan on 1.12.2021.
//

import Foundation
import Service
class BookInformationPresenter {
    
    weak var view: BookInformationView?
    weak var router: BookInformationRouter?
    var selectedDreamWord: DreamWord?
    func didLoad() {
        guard let selectedDream  = selectedDreamWord else {return}
        guard let dreamWordTitle = selectedDream.dreamWordTitle else {return}
        guard let dreamWordDesc = selectedDream.dreamWordDescription else {return}
        view?.updateLabels(title: dreamWordTitle, describtionText: dreamWordDesc)
    }
}
