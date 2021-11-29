//
//  SendCustomView.swift
//  UIComponents
//
//  Created by Berkehan on 25.11.2021.
//

import Foundation
import UIKit
public class SendCustomView: UIView {
    public var titleLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 14.0)

        return label
    }()
    public let transparentView = UIView()
    public init(title: String) {
        super.init(frame: .zero)
        setup()
        titleLabel.text = title
        self.backgroundColor = UIColor.sendActive
        
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        self.addSubview(transparentView)
        self.isUserInteractionEnabled = false
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.layer.cornerRadius = frame.width * 0.25
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            
            transparentView.topAnchor.constraint(equalTo: self.topAnchor),
            transparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            transparentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        ])
        transparentView.layer.cornerRadius = frame.width * 0.25

    }
    
    public func showTransparentView() {
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.2)

    }
    
    public func hideTransparentView() {
        transparentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}

