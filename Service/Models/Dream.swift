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
    public init(dream: String, dreamTopic: String, isPending: Bool, createdDate: String) {
        self.dream = dream
        self.dreamTopic = dreamTopic
        self.isPending = isPending
        self.createdDateAsString = createdDate
    }
}
