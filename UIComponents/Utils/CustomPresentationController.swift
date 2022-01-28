//
//  CustomPresentationController.swift
//  UIComponents
//
//  Created by Berkehan on 13.12.2021.
//

import Foundation
import UIKit
class CustomPresentationController: UIPresentationController {
    var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
    
    @objc func dismiss(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
    }
    
    override var frameOfPresentedViewInContainerView: CGRect{
        return CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height/2), size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height/2))
    }
    
    override func presentationTransitionWillBegin() {
        let bdView = UIView(frame: containerView!.bounds)
        bdView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        containerView?.addSubview(bdView)
        bdView.addSubview(presentedView!)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
        bdView.addGestureRecognizer(tapGesture)
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView!.layer.masksToBounds = true
        presentedView!.layer.cornerRadius = 10
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        self.presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
}
