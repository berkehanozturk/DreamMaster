//
//  BackButton.swift
//  UIComponents
//
//  Created by Berkehan on 13.11.2021.
//

import UIKit
public class BackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupButton() {
        setBackgroundImage(UIImage(named: "backButton"), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
