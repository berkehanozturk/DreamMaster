//
//  ValidatableController.swift
//  App
//
//  Created by Berkehan on 6.07.2021.
//

import Foundation

import UIKit

protocol ValidatableController where Self: BaseViewController {
    func validate() -> ValidationResult
}

extension ValidatableController {

    func validate() -> ValidationResult {
        if let scrollView = view.subviews.first(where: { $0 is UIScrollView }) {
            print("evet scrol")
            if let view = scrollView.subviews.first(where: { $0 is UIView }) {
                print("evet view")
                if let stackview = view.subviews.first(where: { $0 is UIStackView }) {
                    print("evet stack")
                    for element in stackview.subviews {
                        if let validatable = element as? Validatable, !element.isHidden {
                            let result = validatable.validate(updateOption: .update)
                            switch result {
                            case .invalid(let errorMessage):
                                return .invalid(errorMessage: errorMessage)
                            default:
                                break
                            }
                        }
                    }
                }
            }
        }
        return .valid
    }
    
    func validateWithoutScrollView() -> ValidationResult {
        if let stackview = view.subviews.first(where: { $0 is UIStackView }) {
            print("evet stack")
            print(stackview.subviews)
            for element in stackview.subviews {
                if let validatable = element as? Validatable, !element.isHidden {
                    let result = validatable.validate(updateOption: .update)
                    switch result {
                    case .invalid(let errorMessage):
                        return .invalid(errorMessage: errorMessage)
                    default:
                        break
                    }
                }
            }
        }
        
        return .valid
    }
    
    func validateWithStackInView() -> ValidationResult {
        if let view = view.subviews.first(where: { $0 is UIView }) {
            print("evet view")
            if let stackview = view.subviews.first(where: { $0 is UIStackView }) {
                print("evet stack")
                print(stackview.subviews)
                for element in stackview.subviews {
                    if let validatable = element as? Validatable, !element.isHidden {
                        let result = validatable.validate(updateOption: .update)
                        switch result {
                        case .invalid(let errorMessage):
                            return .invalid(errorMessage: errorMessage)
                        default:
                            break
                        }
                    }
                }
            }
        }
        return .valid
    }
}
