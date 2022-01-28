//
//  DropDownField.swift
//  UIComponents
//
//  Created by Berkehan on 13.12.2021.
//

import Foundation
import UIKit
import Core
public class DropDownField: UIControl {

    public var placeHolderText: String?
    public var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    

    public var dropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: ImageNames.drop)
        return imageView
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()

    }
    public init(placeHolderText: String) {
        super.init(frame: .zero)
        initialize()
        self.placeHolderText = placeHolderText
        label.text = placeHolderText
        self.backgroundColor = .white
    }

    func initialize() {
        self.addSubview(label)
        self.addSubview(dropImageView)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            label.centerYAnchor.constraint(equalTo: dropImageView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: dropImageView.leadingAnchor,constant: -8),
            label.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            dropImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            dropImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dropImageView.heightAnchor.constraint(equalToConstant: 12),
            dropImageView.widthAnchor.constraint(equalToConstant: 20),
            
        ])
    }
}
