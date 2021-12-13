//
//  BooksPresenter.swift
//  Application
//
//  Created by Berkehan on 24.11.2021.
//

import Foundation
import Service
class BooksPresenter {
    
    weak var view: BooksView?
    weak var router: BooksRouter?
    var dreamListSections = [DreamListSection]()

    func prepareSections() {
        let wordList = getWordList()
        let groupedDictionary = Dictionary(grouping: wordList, by: {(String(($0.dreamWordTitle?.prefix(1).first)!))})
        let keys = groupedDictionary.keys.sorted()
        dreamListSections = keys.map {DreamListSection(letter: $0, dreamWords: groupedDictionary[$0]!.sorted()) }
    }
    
    func getDreamListSections() -> [DreamListSection] {
        return dreamListSections
    }
    
    func getWordList() -> [DreamWord] {
        return Globals.myWordList
    }
    
    func dreamSelected(dream: DreamWord) {
        self.router?.goToBookInformationScreen(dream: dream)
    }
}
