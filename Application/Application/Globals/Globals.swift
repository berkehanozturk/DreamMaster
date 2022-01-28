//
//  Globals.swift
//  Application
//
//  Created by Berkehan on 16.11.2021.
//

import UIKit
import Service
public struct Globals {
    public static var coinCount: CGFloat = 5.0
    public static var myDreams: [Dream] = [
        Dream(dream: "dream1", dreamTopic: "Dream1", isPending: true, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
        Dream(dream: "dream1", dreamTopic: "Dream2", isPending: true, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
        Dream(dream: "dream1", dreamTopic: "Dream3", isPending: true, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
        Dream(dream: "dream1", dreamTopic: "Dream4", isPending: true, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
        Dream(dream: "dream1", dreamTopic: "Dream5", isPending: true, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
        Dream(dream: "dream1", dreamTopic: "Dream6", isPending: true, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
        Dream(dream: "dream1", dreamTopic: "Dream7", isPending: true, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
        Dream(dream: "dream1", dreamTopic: "Dream8", isPending: true, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
        
//        Dream(dream: "dream1", dreamTopic: "Dream9", isPending: false, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
//        Dream(dream: "dream1", dreamTopic: "Dream10", isPending: false, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
//        Dream(dream: "dream1", dreamTopic: "Dream11", isPending: false, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
//        Dream(dream: "dream1", dreamTopic: "Dream12", isPending: false, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
//        Dream(dream: "dream1", dreamTopic: "Dream13", isPending: false, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
//        Dream(dream: "dream1", dreamTopic: "Dream14", isPending: false, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
//        Dream(dream: "dream1", dreamTopic: "Dream15", isPending: false, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
//        Dream(dream: "dream1", dreamTopic: "Dream16", isPending: false, createdDate: "now", isPsychological: true, isReligous: true, name: "dream1", jobType: "job1", gender: "gender1", love: "love1"),
    ]
    
    public static var myWordList: [DreamWord] = [DreamWord(dreamWordTitle: "agaç", dreamWordDescription: "ağaç falan filan"),
                                                 DreamWord(dreamWordTitle: "kitap", dreamWordDescription: "kitap falan filan"),
                                                DreamWord(dreamWordTitle: "sevgi", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "güzellik", dreamWordDescription: "güzellik falan filan"),
                                                DreamWord(dreamWordTitle: "qan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "wan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "ean", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "ran", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "tan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "yan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "uan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "ıan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "oan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "pan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "ğan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "üan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "san", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "dan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "fan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "gan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "han", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "jan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "kan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "lan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "şan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "ian", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "zan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "xan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "van", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "ban", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "nan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "man", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "öan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "çan", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "xian", dreamWordDescription: "sevgi falan filan"),
                                                DreamWord(dreamWordTitle: "xaan", dreamWordDescription: "sevgi falan filan"),

                                                
]

}
