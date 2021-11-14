//
//  InputField.swift
//  UIComponents
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit
public class InputFieldControl: UIControl, UITextFieldDelegate {
    var placeHolderLabelBottomConstraint: NSLayoutConstraint!
    var placeHolderLabelTopConstraint: NSLayoutConstraint!
    
    public var iconImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var textField: UITextField  = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(textFieldSelected), for: UIControl.Event.editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldReleased), for: UIControl.Event.editingDidEnd)
        return textField
    }()
    
    public var placeHolderLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    public init(image: UIImage?, placeHolder: String) {
        super.init(frame: .zero)
        setup()
        iconImageView.image = image
        iconImageView.contentMode = .scaleAspectFit
        textField.textColor = .black
        placeHolderLabel.text = placeHolder
        self.backgroundColor = .white
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(iconImageView)
        self.addSubview(textField)
        self.addSubview(placeHolderLabel)
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        self.addGestureRecognizer(tapGesture)
        textField.delegate  = self
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor,
                                               constant: 10),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            placeHolderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            placeHolderLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            
            iconImageView.centerYAnchor.constraint(equalTo: self.textField.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 0.5),
            iconImageView.widthAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 0.5),
        ])
        placeHolderLabelBottomConstraint = NSLayoutConstraint(item: placeHolderLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        placeHolderLabelBottomConstraint.isActive = true
        placeHolderLabelTopConstraint = NSLayoutConstraint(item: placeHolderLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        placeHolderLabelTopConstraint.isActive = true
      

    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height * 0.25
        self.layer.borderWidth = 1
        self.layer.borderColor =  UIColor.clear.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func textFieldSelected() {
        animatePlaceHolderUp()
        self.layer.borderColor =  UIColor.blue.cgColor
    }
    
    @objc private func textFieldReleased() {
        animatePlaceHolderDown()
        self.layer.borderColor =  UIColor.clear.cgColor

    }
    
    @objc private func viewClicked() {
        textField.becomeFirstResponder()
        textFieldSelected()
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

