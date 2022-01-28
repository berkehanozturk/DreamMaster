//
//  DreamMasterButton.swift
//  UIComponents
//
//  Created by Berkehan on 13.11.2021.
//
import UIKit
public protocol DreamMasterButtonDelegate: AnyObject {
    func buttonClicked()
}

public class DreamMasterButton: UIButton {
    public weak var delegate: DreamMasterButtonDelegate?
    public enum ButtonStyle {
        case filledBlue
        case sendStyle
    }
    
    public var style: ButtonStyle = .filledBlue {
        didSet {
            updateStyle()
        }
    }
    public let transparentView = UIView()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
        
    }
    
    open func initialize() {
        style = .filledBlue
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(transparentView)
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.2)

    }
    @objc func buttonClicked() {
        delegate?.buttonClicked()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        self.layoutIfNeeded()
        updateStyle()
    }
    
    func updateStyle() {
        switch style {
        case .filledBlue:
            backgroundColor = UIColor.dreamMasterColor
            setTitleColor(UIColor.white, for: .normal)
            layer.shadowOffset = .zero
            contentHorizontalAlignment = .center
            layer.shadowRadius = 5
            layer.shadowOpacity = 1
            titleLabel?.adjustsFontSizeToFitWidth = true
            layer.cornerRadius = self.frame.height * 0.25
            
        case .sendStyle:
            backgroundColor = UIColor.sendActive
            setTitleColor(UIColor.white, for: .normal)
            layer.shadowOffset = .zero
            contentHorizontalAlignment = .center
            layer.shadowRadius = 5
            layer.shadowOpacity = 1
            titleLabel?.adjustsFontSizeToFitWidth = true
            layer.cornerRadius = self.frame.height * 0.25
            NSLayoutConstraint.activate([
                transparentView.topAnchor.constraint(equalTo: self.topAnchor),
                transparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                transparentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                transparentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
            let tap = UITapGestureRecognizer(target: self, action: #selector(buttonClicked))
            self.addGestureRecognizer(tap)
        }
    }
    
    public func showTransparentView() {
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.2)

    }
    
    public func hideTransparentView() {
        transparentView.backgroundColor = .clear
    }
}
