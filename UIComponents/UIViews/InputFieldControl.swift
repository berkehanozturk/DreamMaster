//
//  InputField.swift
//  UIComponents
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit
public protocol InputFieldControlDelegate: AnyObject {
    func textViewDidChanged()
}
public class InputFieldControl: UIControl, UITextViewDelegate {
    var placeHolderLabelBottomConstraint: NSLayoutConstraint!
    var textViewLeadingConstraint: NSLayoutConstraint!
    var placeHolderLabelTopConstraint: NSLayoutConstraint!
    
    public enum InputFieldType {
        case classic
        case dreamWriting
    }
    
    public var iconImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var textField: UITextView  = {
        let textField = UITextView()
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
    public weak var delegate: InputFieldControlDelegate?
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
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            placeHolderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor,constant: 5),
            placeHolderLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            
            iconImageView.centerYAnchor.constraint(equalTo: self.textField.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
        ])
    
        textViewLeadingConstraint = NSLayoutConstraint(item: textField, attribute: .leading, relatedBy: .lessThanOrEqual, toItem: iconImageView, attribute: .trailing, multiplier: 1, constant: 10)
        textViewLeadingConstraint.isActive = true
        placeHolderLabelBottomConstraint = NSLayoutConstraint(item: placeHolderLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        placeHolderLabelBottomConstraint.isActive = true
        placeHolderLabelTopConstraint = NSLayoutConstraint(item: placeHolderLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        placeHolderLabelTopConstraint.isActive = true
      

    }
    
    func updateStyle() {
        switch style {
        case .classic:
            layer.cornerRadius = frame.height * 0.25
            layer.borderWidth = 1
            layer.borderColor =  UIColor.clear.cgColor
            textField.textContainer.maximumNumberOfLines = 1

        case .dreamWriting:
            backgroundColor = UIColor.clear
            textField.textContainer.maximumNumberOfLines = 100
            iconImageView.removeFromSuperview()
            textViewLeadingConstraint = NSLayoutConstraint(item: textField, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 10)
            textViewLeadingConstraint.isActive = true
            placeHolderLabelBottomConstraint.isActive = false
            placeHolderLabelTopConstraint.constant = 5
            textField.adjustsFontForContentSizeCategory = true
            textField.font = UIFont.systemFont(ofSize: 17.0)
            textField.layer.cornerRadius = frame.width * 0.02
            textField.layer.borderWidth = 1
        //  setTitleColor(UIColor.white, for: .normal)
//            layer.shadowOffset = .zero
//            contentHorizontalAlignment = .center
//            layer.shadowRadius = 5
//            layer.shadowOpacity = 1
//            setTitleColor(UIColor.white, for: .normal)
//            titleLabel?.adjustsFontSizeToFitWidth = true
            
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
         textFieldSelected()
         textField.layer.borderColor =  UIColor.blue.cgColor

     }
     
    public func textViewDidEndEditing(_ textView: UITextView) {
         textFieldReleased()
         textField.layer.borderColor =  UIColor.clear.cgColor


     }
    public func textViewDidChange(_ textView: UITextView) {
        if style == .dreamWriting {
            delegate?.textViewDidChanged()
            if textField.text.isEmpty  {
                placeHolderLabel.text = placeHolderText
            }else {
                placeHolderLabel.text = ""
            }
        }
    }
    
    private func textFieldSelected() {
        if style == .classic {
            animatePlaceHolderUp()
            self.layer.borderColor =  UIColor.blue.cgColor
        }
    }
    
    private func textFieldReleased() {
        if style == .classic {
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

