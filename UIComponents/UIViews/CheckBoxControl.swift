//
//  CheckBoxControll.swift
//  UIComponents
//
//  Created by Berkehan on 16.12.2021.
//

import Foundation
import UIKit
import Core
public class CheckBoxControl: UIControl {
    public var isChecked: Bool = true {
          didSet {
              if isChecked == true {
                UIImageView.transition(with: checkBoxImageView,
                                  duration: 0.3,
                                  options: .transitionFlipFromTop,
                                  animations: { self.checkBoxImageView.image = UIImage(named: ImageNames.checked) },
                                  completion: nil)
                
              } else {
                UIImageView.transition(with: checkBoxImageView,
                                  duration: 0.3,
                                  options: .transitionFlipFromBottom,
                                  animations: { self.checkBoxImageView.image = UIImage(named: ImageNames.notChecked) },
                                  completion: nil)
              }
          }
      }
    public var checkBoxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: ImageNames.checked)
        return imageView
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
        self.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clicked))
        self.addGestureRecognizer(gesture)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        layer.cornerRadius = frame.height * 0.25
        layer.borderWidth = 1
        layer.borderColor =  UIColor.clear.cgColor
        
    }
    
    @objc func clicked() {
        isChecked = !isChecked
    }
    
    func initialize() {
        self.backgroundColor = .white
        self.addSubview(descriptionLabel)
        self.addSubview(checkBoxImageView)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: checkBoxImageView.trailingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: checkBoxImageView.topAnchor,constant: 5),

            checkBoxImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkBoxImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            checkBoxImageView.heightAnchor.constraint(equalToConstant: 30),
            checkBoxImageView.widthAnchor.constraint(equalToConstant: 30),
            
        ])
    }
}
