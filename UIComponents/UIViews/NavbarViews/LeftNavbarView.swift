//
//  LeftNavbarView.swift
//  UIComponents
//
//  Created by Berkehan on 16.11.2021.
//

import UIKit

public protocol LeftNavbarViewDelegate: AnyObject {
    func leftBarButtonClicked()
}

public class LeftNavbarView: UIView {
    public var leftNavbarViewDelegate: LeftNavbarViewDelegate?

    public var leftImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var goldLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        return label
    }()
    
    public init(image: UIImage?, goldTotal: CGFloat) {
        super.init(frame: .zero)
        setup()
        leftImageView.image = image
        leftImageView.contentMode = .scaleToFill
        goldLabel.text = "\(goldTotal)"
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leftImageView)
        self.addSubview(goldLabel)
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        self.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            goldLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            goldLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            leftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leftImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            leftImageView.widthAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.7),
            leftImageView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.7),

        ])
    

    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func viewClicked() {
        leftNavbarViewDelegate?.leftBarButtonClicked()
    }
}

