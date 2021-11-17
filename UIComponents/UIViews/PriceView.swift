//
//  PriceView.swift
//  UIComponents
//
//  Created by Berkehan on 16.11.2021.
//

import UIKit
public class PriceView: UIView {
    public var leftImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    public var titleLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    public init(image: UIImage?, title: String) {
        super.init(frame: .zero)
        setup()
        leftImageView.image = image
        titleLabel.text = title
        self.backgroundColor = .clear
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leftImageView)
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: leftImageView.centerYAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalTo: leftImageView.heightAnchor, constant: 0),

            leftImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            leftImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            leftImageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)

        ])
        NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: leftImageView, attribute: .trailing, multiplier: 1.15, constant: 0).isActive = true

        NSLayoutConstraint(item: leftImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 0.85, constant: 0).isActive = true


    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        titleLabel.layoutIfNeeded()
        titleLabel.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}

