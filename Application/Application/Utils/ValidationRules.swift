//
//  ValidationRules.swift
//  App
//
//  Created by Berkehan on 6.07.2021.
//

import Foundation

public typealias Validation = ValidationRule & ErrorMessageProvider

public class MinMaxLengthValidation: AnyValidationRule<String> {
    
    public struct Rule: Validation {
        
        public let min: Int?
        public let max: Int?
        
        public var errorMessageBlock: (Rule) -> String
        
        public init(min: Int? = nil, max: Int? = nil, errorMessageBlock: ((Rule) -> String)? = nil) {
            self.min = min
            self.max = max
//            self.errorMessageBlock = errorMessageBlock ?? { "\($0.min) ile \($0.max) arasında olmalıdır." }
            self.errorMessageBlock = errorMessageBlock ?? {
                if let minVal = $0.min, let maxVal = $0.max {
                    return "Number of characters must be between \(minVal) and \(maxVal)."
                } else if let maxVal = $0.max {
                    return "The number of characters must be at most \(maxVal)."
                } else if let minVal = $0.min {
                    return "The number of characters must be at least \(minVal)."
                } else {
                    return "Character count error!"
                }
            }
        }
        
        public func validate(_ input: String?) -> ValidationResult {
            guard let text = input else { return .invalid(errorMessage: "Field cannot be left empty") }
            let length = text.count
            
            var isValid = false
            if let minVal = min, length >= minVal, let maxVal = max, length <= maxVal {
                isValid = true
            } else if min == nil, let maxVal = max, length <= maxVal {
                isValid = true
            } else if max == nil, let minVal = min, length >= minVal {
                isValid = true
            }
            
            return isValid ? .valid : .invalid(errorMessage: errorMessageBlock(self))
        }
        
    }
    
    public init(min: Int? = nil, max: Int? = nil, errorMessageBlock: ((Rule) -> String)? = nil) {
        if min == nil, max == nil {
            fatalError("No validation value entered!")
        }
        super.init(rule: Rule(min: min, max: max, errorMessageBlock: errorMessageBlock))
    }
    
}

public class SameCharacterValidation: AnyValidationRule<String> {

    public struct Rule: Validation {

        public let character: String
        public let shouldSame: Bool

        public var errorMessageBlock: (Rule) -> String

        public init(character: String, shouldSame: Bool, errorMessageBlock: ((Rule) -> String)? = nil) {
            self.character = character
            self.shouldSame = shouldSame
            self.errorMessageBlock = errorMessageBlock ?? { _ in "Please enter the same values in both fields." }
        }

        public func validate(_ input: String?) -> ValidationResult {
            guard let text = input else { return .invalid(errorMessage: "Field cannot be left empty") }
            var same: Bool = true
            for sub in text where String(sub) != character {
                same = false
            }
            if same {
                return shouldSame ? .valid : .invalid(errorMessage: errorMessageBlock(self))
            } else {
                return shouldSame ? .invalid(errorMessage: errorMessageBlock(self)) : .valid
            }
        }
    }

    public init(character: String, shouldSame: Bool, errorMessageBlock: ((Rule) -> String)? = nil) {
        super.init(rule: Rule(character: character, shouldSame: shouldSame, errorMessageBlock: errorMessageBlock))
    }
}

public class SameInputValidation: AnyValidationRule<String> {

    public struct Rule: Validation {

        public let inputText: String
        public let shouldSame: Bool

        public var errorMessageBlock: (Rule) -> String

        public init(inputText: String, shouldSame: Bool, errorMessageBlock: ((Rule) -> String)? = nil) {
            self.inputText = inputText
            self.shouldSame = shouldSame
            self.errorMessageBlock = errorMessageBlock ?? { _ in "Please enter the same values in both fields." }
        }

        public func validate(_ input: String?) -> ValidationResult {
            guard let text = input else { return .invalid(errorMessage: "Field cannot be left empty") }
            var same: Bool = true
            if text == self.inputText {
                same = true
            } else {
                same = false
            }
            
            if same {
                return shouldSame ? .valid : .invalid(errorMessage: errorMessageBlock(self))
            } else {
                return shouldSame ? .invalid(errorMessage: errorMessageBlock(self)) : .valid
            }
        }
    }

    public init(inputText: String, shouldSame: Bool, errorMessageBlock: ((Rule) -> String)? = nil) {
        super.init(rule: Rule(inputText: inputText, shouldSame: shouldSame, errorMessageBlock: errorMessageBlock))
    }
}

public class EmailValidation: AnyValidationRule<String> {
    
    public struct Rule: Validation {
        
        public var errorMessageBlock: (Rule) -> String
        
        public init(errorMessageBlock: ((Rule) -> String)? = nil) {
            self.errorMessageBlock = errorMessageBlock ?? { _ in "Invalid email format" }
        }
        
        public func validate(_ input: String?) -> ValidationResult {
            guard let text = input, !text.isEmpty else { return .invalid(errorMessage: "Email field cannot be left empty") }
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: text) ? .valid : .invalid(errorMessage: errorMessageBlock(self))
        }
        
    }
    
    public init(errorMessageBlock: ((Rule) -> String)? = nil) {
        super.init(rule: Rule(errorMessageBlock: errorMessageBlock))
    }
    
}

public struct MinMaxValueRule<Input>: Validation {
    
    public let min: Double?
    public let max: Double?
    
    public var errorMessageBlock: (MinMaxValueRule) -> String
    
    public init(min: Double? = nil, max: Double? = nil, errorMessageBlock: ((MinMaxValueRule) -> String)? = nil) {
        self.min = min
        self.max = max
        self.errorMessageBlock = errorMessageBlock ?? {
            
            if let minVal = $0.min, let maxVal = $0.max {
                return "The value entered must be between \(minVal) and \(maxVal)."
            } else if let maxVal = $0.max {
                return "The entered value must be at most \(maxVal)."
            } else if let minVal = $0.min {
                return "The entered value must be at least \(minVal)."
            } else {
                return "The entry is not valid."
            }
        }
    }
    
    private func doubleValue(_ input: Input?) -> Double? {
        if let input = input as? Int {
            return Double(input)
        } else if let input = input as? Double {
            return input
        } else if let input = input as? String {
            return Double(input)
        } else {
            return nil
        }
    }
    
    public func validate(_ input: Input?) -> ValidationResult {
        guard let value = doubleValue(input) else { return .invalid(errorMessage: "Invalid value!") }
        
        var isValid = false
        if let minVal = min, value >= minVal, let maxVal = max, value <= maxVal {
            isValid = true
        } else if min == nil, let maxVal = max, value <= maxVal {
            isValid = true
        } else if max == nil, let minVal = min, value >= minVal {
            isValid = true
        }
        return isValid ? .valid : .invalid(errorMessage: errorMessageBlock(self))
    }
    
}

public class MinMaxValueValidation: AnyValidationRule<Double> {
    
    public init(min: Double? = nil, max: Double? = nil, errorMessageBlock: ((MinMaxValueRule<Double>) -> String)? = nil) {
        if min == nil, max == nil {
            fatalError("No validation value entered!")
        }
        super.init(rule: MinMaxValueRule<Double>(min: min, max: max, errorMessageBlock: errorMessageBlock))
    }
    
}

public class MinMaxValueStringValidation: AnyValidationRule<String> {
    
    public init(min: Double? = nil, max: Double? = nil, errorMessageBlock: ((MinMaxValueRule<String>) -> String)? = nil) {
        if min == nil, max == nil {
            fatalError("No validation value entered!")
        }
        super.init(rule: MinMaxValueRule<String>(min: min, max: max, errorMessageBlock: errorMessageBlock))
    }
    
}

public class RequiredValidation: AnyValidationRule<Bool> {
    
    public struct Rule: Validation {
        
        public var errorMessageBlock: (Rule) -> String
        
        public init(errorMessageBlock: ((Rule) -> String)? = nil) {
            self.errorMessageBlock = errorMessageBlock ?? { _ in "The field is required." }
        }
        
        public func validate(_ input: Bool?) -> ValidationResult {
            guard let value = input else { return .invalid(errorMessage: errorMessageBlock(self)) }
            return value ? .valid : .invalid(errorMessage: errorMessageBlock(self))
        }
    }
    
    public init(errorMessageBlock: ((Rule) -> String)? = nil) {
        super.init(rule: Rule(errorMessageBlock: errorMessageBlock))
    }
    
}
