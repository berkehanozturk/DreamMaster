//
//  DreamMasterButton.swift
//  UIComponents
//
//  Created by Berkehan on 13.11.2021.
//
import UIKit
public class DreamMasterButton: UIButton {
    
    public enum ButtonStyle {
        case filledBlue
    }
    
    public var style: ButtonStyle = .filledBlue {
        didSet {
            updateStyle()
        }
    }
    
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
        }
    }
    
}
