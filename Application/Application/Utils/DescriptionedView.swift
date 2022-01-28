//
//  DescriptionedView.swift
//  UIComponents
//
//  Created by Berkehan on 13.12.2021.
//

import Foundation
import UIKit
import Core
import UIComponents
public class DecriptionedView: UIControl {
    public var dropDownField: DropDownField = {
        let dropDownField = DropDownField(placeHolderText: Localizables.InfoScreen.select)
        dropDownField.translatesAutoresizingMaskIntoConstraints = false
        return dropDownField
    }()
    
    public var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()

    }
    public init(descriptionText: String) {
        super.init(frame: .zero)
        initialize()
        descriptionLabel.text = descriptionText

    }

    func initialize() {
        self.backgroundColor = .white
        self.addSubview(descriptionLabel)
        self.addSubview(dropDownField)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: -10),

            dropDownField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dropDownField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dropDownField.topAnchor.constraint(equalTo: self.topAnchor),
            dropDownField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
}
extension DecriptionedView: ValidatableInterfaceElement {
    public var input: Bool? {
        print(dropDownField.label.text)
        print(dropDownField.placeHolderText)
        if dropDownField.label.text !=  dropDownField.placeHolderText && !dropDownField.label.text!.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    public func onValidation(result: ValidationResult) {
        
    }
    
}
