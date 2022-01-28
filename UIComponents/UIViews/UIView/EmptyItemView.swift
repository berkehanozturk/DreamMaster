//
//  EmptyItemView.swift
//  UIComponents
//
//  Created by Berkehan on 4.01.2022.
//

import Foundation
import UIKit
import Core
public class EmptyItemView: UIView {
    
    private var label = UILabel()
    private var iconImageView: UIImageView?

    public init(message: String, imageName: String, parentView: UIView) {
        super.init(frame: .zero)
        label.text = message
        label.textColor = UIColor.appBrownColor
        iconImageView = UIImageView(image: UIImage(named: imageName))
        parentView.addSubview(self)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.6
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)

        setupLayout()
        self.hide()
    }
    

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        iconImageView?.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        self.addSubview(iconImageView!)

        
        NSLayoutConstraint.activate([
            iconImageView!.heightAnchor.constraint(equalTo: superview!.heightAnchor, multiplier: 0.3),
            iconImageView!.widthAnchor.constraint(equalTo: superview!.heightAnchor, multiplier: 0.3),
            iconImageView!.centerXAnchor.constraint(equalTo: superview!.centerXAnchor),
            iconImageView!.centerYAnchor.constraint(equalTo: superview!.centerYAnchor, constant: -50),
            label.centerXAnchor.constraint(equalTo: iconImageView!.centerXAnchor),
            label.trailingAnchor.constraint(equalTo: superview!.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: superview!.leadingAnchor),
            label.topAnchor.constraint(equalTo: iconImageView!.bottomAnchor,constant: 10),

            
        ])
    }
    
    public func show() {
        self.isHidden = false
    }
    
    public func hide() {
        self.isHidden = true
    }
}
