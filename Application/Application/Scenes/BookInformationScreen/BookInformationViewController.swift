//
//  BookInformationViewController.swift
//  Application
//
//  Created by Berkehan on 1.12.2021.
//

import UIKit
import Service
import UIComponents
import Core
protocol BookInformationRouter: AnyObject {
    
}

protocol BookInformationView: AnyObject {
    func updateLabels(title: String, describtionText: String)
}

class BookInformationViewController: BaseViewController {
    
    @IBOutlet weak var titleBubbleView: UIView!
    var presenter = BookInformationPresenter()
    @IBOutlet weak var informationBubbleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)

        customizeNavbar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleBubbleView.layer.cornerRadius = titleBubbleView.frame.width * 0.05
        titleBubbleView.layer.borderWidth = 0.3
        titleBubbleView.layer.borderColor = UIColor.red.cgColor
        informationBubbleView.layer.cornerRadius = informationBubbleView.frame.width * 0.05
        informationBubbleView.layer.borderWidth = 0.3
        informationBubbleView.layer.borderColor = UIColor.blue.cgColor
        informationBubbleView.layer.shadowOffset = CGSize(width: 4, height: 4)
        informationBubbleView.layer.shadowOpacity = 0.6
        informationBubbleView.layer.shadowRadius = 5.0
        titleBubbleView.layer.shadowOffset = CGSize(width: 4, height: 4)
        titleBubbleView.layer.shadowOpacity = 0.6
        titleBubbleView.layer.shadowRadius = 5.0
    }
}

extension BookInformationViewController: BookInformationView {
    func updateLabels(title: String, describtionText: String) {
        titleLabel.text = title
        descriptionLabel.text = describtionText
    }
    
}

extension BookInformationViewController: BookInformationRouter {
    
}
extension BookInformationViewController: NavbarCustomizable {
    func customizeNavbar() {
        navigationItem.title = "Dream Master"

    }
}
