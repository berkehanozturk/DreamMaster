//
//  Validation.swift
//  App
//
//  Created by Berkehan on 6.07.2021.
//

import Foundation
import UIKit

public protocol ValidationRule {
    
    associatedtype Input
    
    func validate(_ input: Input?) -> ValidationResult
}

public class AnyValidationRule<Input> {
    
    public let validate: (Input?) -> ValidationResult
    
    public init<Rule: ValidationRule>(rule: Rule) where Rule.Input == Input {
        self.validate = rule.validate
    }
    
}

public protocol ErrorMessageProvider {
    var errorMessageBlock: (Self) -> String { get set }
}

public enum ValidationResult: Equatable {
    case valid, invalid(errorMessage: String)
    
    public static func == (lhs: ValidationResult, rhs: ValidationResult) -> Bool {
        switch (lhs, rhs) {
        case (.valid, .valid):
            return true
        case let (.invalid(leftErrorMessage), .invalid(rightErrorMessage)):
            return leftErrorMessage == rightErrorMessage
        default:
            return false
        }
    }
}

public enum ValidationInterfaceUpdateOption {
    case update, doNotUpdate, updateWhenValid
}

public protocol Validatable {
    var shouldValidate: Bool { get set }
    func validate(updateOption: ValidationInterfaceUpdateOption) -> ValidationResult
    func onValidation(result: ValidationResult)
}

private var validatableShouldValidate: UInt8 = 0

public extension Validatable {
    
    var shouldValidate: Bool {
        get {
            return (objc_getAssociatedObject(self, &validatableShouldValidate) as? Bool) ?? true
        }
        set {
            objc_setAssociatedObject(self, &validatableShouldValidate, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
}

public protocol ValidatableInterfaceElement: Validatable, AnyObject {
    associatedtype Input
    var input: Input? { get }
    var validationRules: [AnyValidationRule<Input>]? { get set }
}

private var validatableInterfaceElementValidationRules: UInt8 = 0

public extension ValidatableInterfaceElement {
    
    var validationRules: [AnyValidationRule<Input>]? {
        get {
            return objc_getAssociatedObject(self, &validatableInterfaceElementValidationRules) as? [AnyValidationRule<Input>]
        }
        set {
            if let value = newValue {
                objc_setAssociatedObject(self, &validatableInterfaceElementValidationRules, value, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            }
        }
    }
    
    func validate(updateOption: ValidationInterfaceUpdateOption) -> ValidationResult {
        var finalResult: ValidationResult = .valid
        if let rules = validationRules {
            for rule in rules {
                let result = rule.validate(input)
                if case .invalid = result {
                    finalResult = result
                    break
                }
            }
        }
        if case .update = updateOption {
            onValidation(result: finalResult)
        } else if case .updateWhenValid = updateOption, case .valid = finalResult {
            onValidation(result: .valid)
        }
        return finalResult
    }
    
}
