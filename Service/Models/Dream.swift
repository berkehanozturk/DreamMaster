//
//  Dream.swift
//  Service
//
//  Created by Berkehan on 26.11.2021.
//

import Foundation

public struct Dream {
    public var dream: String?
    public var dreamTopic: String?
    public var isPending: Bool?
    public var createdDateAsString: String?
    public var isPsychological: Bool?
    public var isReligous: Bool?
    public var name: String?
    public var jobType: String?
    public var gender: String?
    public var love: String?

    public init(dream: String, dreamTopic: String, isPending: Bool, createdDate: String, isPsychological: Bool, isReligous: Bool, name: String, jobType: String, gender: String, love: String) {
        self.dream = dream
        self.dreamTopic = dreamTopic
        self.isPending = isPending
        self.createdDateAsString = createdDate
        self.isReligous = isReligous
        self.isPsychological = isPsychological
        self.name = name
        self.jobType = jobType
        self.gender = gender
        self.love = love
    }
}
