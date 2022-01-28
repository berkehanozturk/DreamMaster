//
//  DreamField.swift
//  Application
//
//  Created by Berkehan on 11.01.2022.
//

import Foundation
import UIKit

public protocol InputFieldControlDelegate: AnyObject {
    func textViewDidChanged()
}

public class DreamFieldControl: UIControl, UITextViewDelegate, UITextFieldDelegate {
    var placeHolderLabelBottomConstraint: NSLayoutConstraint!
    var textViewLeadingConstraint: NSLayoutConstraint!
    var placeHolderLabelTopConstraint: NSLayoutConstraint!
    var textFieldTopConstraint: NSLayoutConstraint!

    public enum InputFieldType {
        case dreamWriting
    }
    
    public var textField: UITextView  = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        return textField
    }()
    
    public var placeHolderLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    public var style: InputFieldType = .dreamWriting {
        didSet {
            updateStyle()
        }
    }
    public weak var delegate: InputFieldControlDelegate?
    public var placeHolderText: String?
    public init(image: UIImage?, placeHolder: String) {
        super.init(frame: .zero)
        setup()
        textField.textColor = .black
        placeHolderLabel.text = placeHolder
        placeHolderText = placeHolder
        self.backgroundColor = .white
        style = .dreamWriting
        textField.delegate = self

    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textField)
        self.addSubview(placeHolderLabel)
        self.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textField.topAnchor.constraint(equalTo: self.topAnchor),

            placeHolderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 10),
            placeHolderLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor)
            
        ])
     
        placeHolderLabelBottomConstraint = NSLayoutConstraint(item: placeHolderLabel,
                                                              attribute: .bottom,
                                                              relatedBy: .equal,
                                                              toItem: self,
                                                              attribute: .bottom,
                                                              multiplier: 1,
                                                              constant: 0)
        placeHolderLabelBottomConstraint.isActive = true
        placeHolderLabelTopConstraint = NSLayoutConstraint(item: placeHolderLabel,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: self,
                                                           attribute: .top,
                                                           multiplier: 1,
                                                           constant: 0)
        placeHolderLabelTopConstraint.isActive = true
      
    }
    
    func updateStyle() {
        switch style {
        case .dreamWriting:
            backgroundColor = UIColor.clear
            textField.textContainer.maximumNumberOfLines = 100
            placeHolderLabelBottomConstraint.isActive = false
            placeHolderLabelTopConstraint.constant = 5
            textField.adjustsFontForContentSizeCategory = true
            textField.font = UIFont.systemFont(ofSize: 17.0)
            textField.layer.cornerRadius = frame.width * 0.02
            textField.layer.borderWidth = 1
            
        }
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        updateStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
         textField.layer.borderColor =  UIColor.blue.cgColor

     }

    public func textViewDidEndEditing(_ textView: UITextView) {
         textField.layer.borderColor =  UIColor.clear.cgColor
     }

    public func textViewDidChange(_ textView: UITextView) {
        if style == .dreamWriting {
            delegate?.textViewDidChanged()
            if textField.text!.isEmpty {
                placeHolderLabel.text = placeHolderText
            } else {
                placeHolderLabel.text = ""
            }
        }
    }
    
}
extension DreamFieldControl: ValidatableInterfaceElement {
 
    public var input: String? {  print(textField.text!)
        return textField.text }
    
    public func onValidation(result: ValidationResult) {
        
    }
}

class PaddingTextField: UITextField {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
    }
}
