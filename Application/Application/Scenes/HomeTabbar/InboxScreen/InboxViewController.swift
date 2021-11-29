//
//  InboxViewController.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit
import UIComponents
import Core
protocol InboxRouter: AnyObject {
    
}

protocol InboxView: AnyObject {
    func updateWithMyDreams()
    func updateWithPendingDreams()
}

class InboxViewController: BaseViewController {
    
    var presenter = InboxPresenter()
    @IBOutlet weak var myDreamView: UIView!
    
    @IBOutlet weak var pendingDreamView: UIView!
    
    @IBOutlet weak var dreamsTableView: UITableView!
    
    @IBOutlet weak var pendingDreamsTableView: UITableView!
    @IBOutlet weak var myDreamsButton: UIButton! {
        didSet {
            myDreamsButton.backgroundColor = UIColor.selectedColor
            myDreamsButton.setTitle(Localizables.InboxTabbar.myDreams, for: .normal)
            myDreamsButton.setTitleColor(.white, for: .normal)
            myDreamsButton.layer.cornerRadius = myDreamsButton.frame.height * 0.2
        }
    }
    
    @IBOutlet weak var pendingDreamsButton: UIButton! {
        didSet {
            pendingDreamsButton.backgroundColor = UIColor.white
            pendingDreamsButton.setTitle(Localizables.InboxTabbar.pendingDreams, for: .normal)
            pendingDreamsButton.layer.cornerRadius = pendingDreamsButton.frame.height * 0.2

        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.borderWidth = 0.5
            containerView.layer.borderColor = UIColor.systemBlue.cgColor
            containerView.layer.cornerRadius = containerView.frame.height * 0.2

        }
    }
    @IBOutlet weak var inboxLabel: UILabel! {
        didSet {
            inboxLabel.text = Localizables.HomeTabbar.inbox
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let color = AppBgColor()
        view.layer.insertSublayer(color.gl, at: 0)
        dreamsTableView.backgroundColor = .clear
        pendingDreamsTableView.backgroundColor = .clear

        customizeNavbar()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        updateWithMyDreams()

    }
    
    private func setup() {
        dreamsTableView.delegate = self
        dreamsTableView.dataSource = self
        pendingDreamsTableView.delegate = self
        pendingDreamsTableView.dataSource = self
        pendingDreamsTableView.register(PendingTableViewCell.self)
        dreamsTableView.register(DreamTableViewCell.self)
        dreamsTableView.separatorStyle = .none
        pendingDreamsTableView.separatorStyle = .none
        tabBarItem.title = Localizables.HomeTabbar.inbox
    }
    @IBAction func myDreamsButtonClicked(_ sender: Any) {
        updateWithMyDreams()
    }
    
    @IBAction func pendingButtonClicked(_ sender: Any) {
        updateWithPendingDreams()
    }
    
}

extension InboxViewController: NavbarCustomizable, LeftNavbarViewDelegate {
    func leftBarButtonClicked() {
        self.tabBarController?.selectedIndex = 2
    }
    
    func customizeNavbar() {
        let leftNavbarCustomView = LeftNavbarView(image: UIImage(named: ImageNames.coin), goldTotal: Globals.coinCount)
        leftNavbarCustomView.leftNavbarViewDelegate = self
        leftNavbarCustomView.translatesAutoresizingMaskIntoConstraints = false
        let barButtonItem2 = UIBarButtonItem(customView: leftNavbarCustomView)
        self.navigationItem.leftBarButtonItem = barButtonItem2
        navigationController?.navigationBar.addSubview(leftNavbarCustomView)
        NSLayoutConstraint.activate([
            leftNavbarCustomView.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!),
            leftNavbarCustomView.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!),
            leftNavbarCustomView.heightAnchor.constraint(equalToConstant: 44),
            leftNavbarCustomView.trailingAnchor.constraint(equalTo: leftNavbarCustomView.goldLabel.trailingAnchor)
        ])
        navigationItem.title = "Dream Master"

    }
}
extension InboxViewController: InboxView {
    func updateWithMyDreams() {
        UIView.animate(withDuration: 0.4) {
            self.myDreamsButton.setTitleColor(.white, for: .normal)
            self.myDreamsButton.backgroundColor = UIColor.selectedColor
        }
        
        UIView.animate(withDuration: 0.4) { [self] in
            self.pendingDreamsButton.setTitleColor(.systemBlue, for: .normal)
            self.pendingDreamsButton.backgroundColor = .white
          
        }
        myDreamView.isHidden = false
        pendingDreamView.isHidden = true
        view.layoutIfNeeded()
        dreamsTableView.reloadData()
    }
    
    func updateWithPendingDreams() {
        UIView.animate(withDuration: 0.1) {
            self.pendingDreamsButton.setTitleColor(.white, for: .normal)
            self.pendingDreamsButton.backgroundColor = UIColor.selectedColor
        }
        
        UIView.animate(withDuration: 0.1) { [self] in
            self.myDreamsButton.setTitleColor(.systemBlue, for: .normal)
            self.myDreamsButton.backgroundColor = .white
      
        }
        pendingDreamView.isHidden = false
        myDreamView.isHidden = true
        pendingDreamsTableView.reloadData()
        view.layoutIfNeeded()
    }
    
}

extension InboxViewController: InboxRouter {
    
}

extension InboxViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return Globals.myDreams.count
        } else if tableView.tag == 2 {
            return Globals.myDreams.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell: DreamTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.backgroundColor = .clear
            tableView.rowHeight = 80
            let dream = Globals.myDreams[indexPath.row]
            if let isPending = dream.isPending {
                cell.setData(dream: dream)

//                if !isPending {
//                }
            }
            return cell
        } else if tableView.tag == 2 {
            let cell: PendingTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            tableView.rowHeight = 80

            let dream = Globals.myDreams[indexPath.row]
            if let isPending = dream.isPending {
                if isPending {
                    cell.setData(dream: dream)
                }
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
