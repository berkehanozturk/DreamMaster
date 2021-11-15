//
//  String.swift
//  Core
//
//  Created by Berkehan on 15.11.2021.
//

import Foundation
public extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
