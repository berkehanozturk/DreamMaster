//
//  MyBarButtonItem.swift
//  UIComponents
//
//  Created by Berkehan on 16.11.2021.
//

import UIKit
import Core
public typealias ButtonActionType = () -> Void

public class MyBarButtonItem: UIBarButtonItem {
    var buttonAction: ButtonActionType?

    public init(buttonIcon: UIImage) {
        super.init()
        setupCustomView()
        setButtonIcon(icon: buttonIcon)
    }

    public init(customView: UIView) {
        super.init()
        self.customView = customView

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setNavbarButtonAction(completion : @escaping ButtonActionType) {
        self.buttonAction = completion
        if let button = self.customView as? UIButton {
            button.addTarget(self, action: #selector(realAction), for: .touchUpInside)
            print("asdas")
        } else {
            let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.realAction))
            self.customView!.addGestureRecognizer(tapGR)
            self.customView!.isUserInteractionEnabled = true
            print("asdasd")
        }

    }

    @objc func realAction() {
        print("realActin")
        self.buttonAction!()
    }

    private func setButtonIcon(icon: UIImage) {
        let button = self.customView as! UIButton
        button.setImage(icon, for: .normal)
        self.customView = button
    }

    private func setupCustomView() {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        self.customView = button

    }
}
