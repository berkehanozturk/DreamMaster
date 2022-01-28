//
//  InputField.swift
//  UIComponents
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit
public class InputFieldControl: UIControl, UITextFieldDelegate {
    var placeHolderLabelBottomConstraint: NSLayoutConstraint!
    var textViewLeadingConstraint: NSLayoutConstraint!
    var placeHolderLabelTopConstraint: NSLayoutConstraint!
    var iconImageViewCenterConstraint: NSLayoutConstraint!
    var textFieldTopConstraint: NSLayoutConstraint!

    public enum InputFieldType {
        case classic
        case noRadius
    }
    
    public var iconImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var textField: UITextField  = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public var placeHolderLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    public var style: InputFieldType = .classic {
        didSet {
            updateStyle()
        }
    }
    public var placeHolderText: String?
    public init(image: UIImage?, placeHolder: String) {
        super.init(frame: .zero)
        setup()
        iconImageView.image = image
        iconImageView.contentMode = .scaleAspectFit
        textField.textColor = .black
        placeHolderLabel.text = placeHolder
        placeHolderText = placeHolder
        self.backgroundColor = .white
        style = .classic
        textField.delegate = self

    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(iconImageView)
        self.addSubview(textField)
        self.addSubview(placeHolderLabel)
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        self.addGestureRecognizer(tapGesture)
        NSLayoutConstraint.activate([
           
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),

            placeHolderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 5),
            placeHolderLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
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
        case .classic:
            layer.cornerRadius = frame.height * 0.25
            layer.borderWidth = 1
            layer.borderColor =  UIColor.clear.cgColor
            
        case .noRadius:
            layer.borderWidth = 1
            layer.borderColor =  UIColor.clear.cgColor
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
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldSelected()
        textField.layer.borderColor =  UIColor.blue.cgColor
        
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldReleased()
        textField.layer.borderColor =  UIColor.clear.cgColor
    }
    
    private func textFieldSelected() {
        if style == .classic || style == .noRadius {
            animatePlaceHolderUp()
            self.layer.borderColor =  UIColor.blue.cgColor
        }
    }
    
    private func textFieldReleased() {
        if style == .classic || style == .noRadius {
            animatePlaceHolderDown()
            self.layer.borderColor =  UIColor.clear.cgColor
        }
    }
    
    @objc private func viewClicked() {
        if style == .classic {
            textField.becomeFirstResponder()
            textFieldSelected()
        }
    }
    
    func animatePlaceHolderDown() {
        if textField.text!.isEmpty {
            UIView.animate(withDuration: 0.5) {
                self.placeHolderLabelBottomConstraint.constant = 0
                self.placeHolderLabelTopConstraint.constant = 0
                self.layoutIfNeeded()
            }
        }
      
    }
    
    func animatePlaceHolderUp() {
        UIView.animate(withDuration: 0.5) {
            self.placeHolderLabelBottomConstraint.constant = -self.frame.height/1.25
            self.placeHolderLabelTopConstraint.constant = -self.frame.height/1.25
            self.layoutIfNeeded()
        }
    }
}
extension InputFieldControl: ValidatableInterfaceElement {
 
    public var input: String? {  print(textField.text!)
        return textField.text }
    
    public func onValidation(result: ValidationResult) {
        
    }
}
