//
//  DatePickerViewController.swift
//  UIComponents
//
//  Created by Berkehan on 13.12.2021.
//

import Foundation
import UIKit
import Core
public protocol isAbleToReceiveDateData: AnyObject {
    func pass(date: Date?)
}
class DatePickerViewController: UIViewController {
    typealias CompletionHandler = (Date?) -> Void
    var completion: CompletionHandler?
    var isRemoveButtonClicked = false
    let datePicker: UIDatePicker = UIDatePicker()
    private var selectedDate: Date?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment  = .center
        return label
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done".localize(), for: .normal)
        button.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    let removeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Remove".localize(), for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.addTarget(self, action: #selector(removeButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        view.addSubview(titleLabel)
        view.addSubview(doneButton)
        view.addSubview(removeButton)
        view.backgroundColor = .white
        datePicker.datePickerMode = .date
        view.layer.cornerRadius = 20
        let currentDate = Date()  //get the current date
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                removeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
                removeButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 20),
                removeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor,constant: 0),
                
                doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
                doneButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 20),
                doneButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor,constant: 0),
                
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0),
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 20),
                titleLabel.heightAnchor.constraint(equalToConstant: 20),
                
                datePicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 0),
                datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
                datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
                datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            ])
        } else {
            // Fallback on earlier versions
        }
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.backgroundColor = UIColor.white
        datePicker.setValue(UIColor.black, forKey: "textColor")
        datePicker.setValue(false, forKey: "highlightsToday")

        datePicker.maximumDate = currentDate
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let completion = completion else {return}
        if isRemoveButtonClicked == false && selectedDate == nil {
            let defaultDate: Date = Date()
            selectedDate = defaultDate
        }
        completion(selectedDate)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
    }
    
    @objc func doneButtonClicked() {
        if selectedDate == nil {
            let defaultDate: Date = Date()
            selectedDate = defaultDate
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func removeButtonClicked() {
        isRemoveButtonClicked = true
        selectedDate = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.transitioningDelegate = self
        self.modalPresentationStyle = .custom
    }
    
    convenience required init(coder aDecoder: NSCoder) {
        self.init()
        
    }
    init() {
        super.init(nibName: nil, bundle: nil)
        self.transitioningDelegate = self
        self.modalPresentationStyle = .custom
    }
}

extension DatePickerViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = CustomPresentationController(presentedViewController: presented, presenting: presenting)
        return presentationController
    }
}
