//
//  SelectableTitleEnum.swift
//  Application
//
//  Created by Berkehan on 24.11.2021.
//

import Foundation
import UIKit
public enum SelectableTitleEnum: String {
    case books
    case dreams
    
    func getSelectableItems() -> String {
        switch self {
        case .books:
            return Localizables.HomeTabbar.books
        case .dreams:
            return Localizables.HomeTabbar.dreams
        }
    }
}
