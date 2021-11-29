//
//  SelectableTitleEnum.swift
//  Application
//
//  Created by Berkehan on 24.11.2021.
//

import Foundation
import UIKit
import Core
public enum SelectableTitleEnum: String {
    case books
    case dreams
    
    public  func getSelectableItems() -> String {
        switch self {
        case .books:
            return Localizables.HomeTabbar.books
        case .dreams:
            return Localizables.HomeTabbar.dreams
        }
    }
}
