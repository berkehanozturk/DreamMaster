//
//  PickerViewController.swift
//  UIComponents
//
//  Created by Berkehan on 13.12.2021.
//

import Foundation
import UIKit
class PickerViewController: UIViewController,PickerSelectable {
    typealias CompletionHandler = (String?) -> Void
    var completion: CompletionHandler?

    let pickerView: UIPickerView = UIPickerView()
    var selectedString: String?
    var options = [String]()
    var isRemoveButtonClicked = false
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment  = .center
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done".localize(), for: .normal)
        button.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
   lazy var removeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Remove".localize(), for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.addTarget(self, action: #selector(removeButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pickerView)
        view.addSubview(titleLabel)
        view.addSubview(doneButton)
        view.addSubview(removeButton)
        view.backgroundColor = .white
        pickerView.backgroundColor = UIColor.white
        pickerView.delegate = self
        pickerView.dataSource = self
        view.layer.cornerRadius = 20

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
                
                pickerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 0),
                pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
                pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
                pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            ])
        } else {
            // Fallback on earlier versions
        }
        
        
        pickerView.setValue(UIColor.black, forKey: "textColor")
    }
    override func viewWillDisappear(_ animated: Bool) {
        //delegate.pass(string: selectedString,selectionType: selectedSelectionType)
        guard let completion = completion else {return}
        if isRemoveButtonClicked == false  && selectedString == nil {
            selectedString = options.first
        }
        completion(selectedString)
    }
    
    @objc func doneButtonClicked() {
        if selectedString == nil {
            selectedString = options.first
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func removeButtonClicked() {

        isRemoveButtonClicked = true
        selectedString = nil
        self.dismiss(animated: true, completion: nil)
        
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
extension PickerViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = CustomPresentationController(presentedViewController: presented, presenting: presenting)
        return presentationController
    }
}
extension PickerViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        options.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedString = options[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
}
