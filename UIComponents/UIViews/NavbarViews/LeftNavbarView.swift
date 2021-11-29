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
        commonInit()
        setupImageViewAndLabel()
        leftImageView.image = image
        leftImageView.contentMode = .scaleToFill
        goldLabel.text = "\(goldTotal)"
    }
    
    public init(image: UIImage?, text: String) {
        super.init(frame: .zero)
        commonInit()
        setupImageViewAndLabel()
        leftImageView.image = image
        leftImageView.contentMode = .scaleToFill
        goldLabel.text = text
    }
    
    public init(customView: UIView) {
        super.init(frame: .zero)
        commonInit()
        setupCustomView(customView: customView)
    }
    private func commonInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        self.addGestureRecognizer(tapGesture)
    }
    
    private func setupImageViewAndLabel() {
        self.addSubview(leftImageView)
        self.addSubview(goldLabel)
    
        NSLayoutConstraint.activate([
            goldLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            goldLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            leftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leftImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            leftImageView.widthAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.7),
            leftImageView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.7),

        ])
    }
    
    func setupCustomView(customView: UIView) {
        customView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(customView)
        NSLayoutConstraint.activate([
  
            customView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            customView.topAnchor.constraint(equalTo: self.topAnchor),
            customView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

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

