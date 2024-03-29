//
//  UIStoryboard+Extensions.swift
//  Application
//
//  Created by Berkehan on 12.11.2021.
//
import UIKit

public extension UIStoryboard {
    
    class func instantiateViewController<T: UIViewController>(_ storyboardName: Storyboards, _: T.Type) -> T? {
    return UIStoryboard(name: storyboardName.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as? T
    }
    
    class func instantiateViewController<T: UIViewController>(_ storyboardName: String, clazz: AnyClass) -> T? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: String(describing: clazz)) as? T
    }
    
    class func instantiateViewController<T: UIViewController>(_ storyboardName: String, identifier: String) -> T? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T
    }
}
