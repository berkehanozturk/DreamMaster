//
//  DreamWord.swift
//  Service
//
//  Created by Berkehan on 29.11.2021.
//

import Foundation

public class DreamWord: Hashable, Comparable {
    public static func < (lhs: DreamWord, rhs: DreamWord) -> Bool {
        return lhs.dreamWordTitle! < rhs.dreamWordTitle!

    }
    
    public var dreamWordTitle: String?
    public var dreamWordDescription: String?
    public init(dreamWordTitle: String, dreamWordDescription: String) {
        self.dreamWordTitle = dreamWordTitle
        self.dreamWordDescription = dreamWordDescription
    }
    public static func ==(lhs: DreamWord, rhs: DreamWord) -> Bool {
         return lhs === rhs
     }

     public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self))
     }
}
