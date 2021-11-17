//
//  Colors.swift
//  UIComponents
//
//  Created by Berkehan on 12.11.2021.
//

import UIKit
/// AppBgColor Class  contains gl variable with type CAGradientLayer
public class AppBgColor {
    public var gl:CAGradientLayer!
    
    public init() {
        let colorTop = UIColor(red: 255.0/255.0, green: 236.0/255.0, blue: 214.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 211/255.0, green: 238.0/255.0, blue: 235/255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        gl.frame = UIScreen.main.bounds
        self.gl.locations = [0.0, 1.0]
    }
}

public extension UIColor {
    
    static let dreamMasterColor = UIColor(red: 110/255, green: 75/255, blue: 228/255, alpha: 1)
    static let selectedColor = UIColor(red: 62/255, green: 105/255, blue: 144/205, alpha: 1)
    
}

