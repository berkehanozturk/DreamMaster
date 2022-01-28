//
//  DreamMasterButton.swift
//  UIComponents
//
//  Created by Berkehan on 16.12.2021.
//

import UIKit
public class SendButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
