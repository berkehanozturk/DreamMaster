//
//  InboxViewController.swift
//  Application
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit
import UIComponents
import Core
import Service
protocol InboxRouter: AnyObject {
    
}

protocol InboxView: BaseView {
    func updateWithMyDreams()
    func updateWithPendingDreams()
    func checkForEmptyItems()
    func updateTableViews()
    func showLoader()
    func hideLoader()
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
    
    lazy var informationViewDream =  EmptyItemView(message: "Inbox is empty", imageName: ImageNames.letter, parentView: dreamsTableView)
    lazy var informationViewPending =  EmptyItemView(message: "pending table", imageName: ImageNames.bookStack, parentView: pendingDreamsTableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        presenter.didLoad()
     
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
        self.presenter.view = self
        self.presenter.router = self
        dreamsTableView.separatorStyle = .none
        pendingDreamsTableView.separatorStyle = .none
        tabBarItem.title = Localizables.HomeTabbar.inbox
        pendingDreamsTableView.rowHeight = 80
        dreamsTableView.rowHeight = 80

        dreamsTableView.refreshControl = UIRefreshControl()
        dreamsTableView.refreshControl?.addTarget(self, action: #selector(refreshed), for: .valueChanged)
        pendingDreamsTableView.refreshControl = UIRefreshControl()
        pendingDreamsTableView.refreshControl?.addTarget(self, action: #selector(pendingRefreshed), for: .valueChanged)
    }
    
    @objc func refreshed() {
        guard let refreshControl = dreamsTableView.refreshControl else {return}
        if refreshControl.isRefreshing {
            presenter.getAllDreams(seconds: 2)
            dreamsTableView.reloadData()
            dreamsTableView.refreshControl?.endRefreshing()
        }
   
    }
    
    @objc func pendingRefreshed() {
        guard let refreshControl = pendingDreamsTableView.refreshControl else {return}
        if refreshControl.isRefreshing {
            pendingDreamsTableView.reloadData()
            pendingDreamsTableView.refreshControl?.endRefreshing()
        }
        
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
    func showLoader() {
        startLoadingAtTargetView(view: dreamsTableView)
    }
    
    func hideLoader() {
        stopLoadingAtTargetView(view: dreamsTableView)
    }
    
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

        view.layoutIfNeeded()
    }
    
    func checkForEmptyItems() {
        print("güncellemem lazım")
        let answeredDreamCount = presenter.getAnsweredDreamCount()
        if answeredDreamCount == 0 {
            informationViewDream.show()
        } else {
            informationViewDream.hide()
        }
        let pendingDreamCount = presenter.getPendingDreamCount()
        if pendingDreamCount == 0 {
            informationViewPending.show()
        } else {
            informationViewPending.hide()
        }
        updateTableViews()
    }
    
    func updateTableViews() {
        print("update etmeli")
        DispatchQueue.main.async {
            self.dreamsTableView.reloadData()
            self.pendingDreamsTableView.reloadData()
        }

    }
    
}

extension InboxViewController: InboxRouter {
    
}

extension InboxViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            print("Anserwered")
            print(presenter.getAnsweredDreamCount())

            return presenter.getAnsweredDreamCount()
        } else if tableView.tag == 2 {
            print("pendingCount")
            print(presenter.getPendingDreamCount())
            return presenter.getPendingDreamCount()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell: DreamTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setAnsweredData(dream: presenter.getDreamAtIndexPathInAnswered(indexPath: indexPath))
            return cell
        } else if tableView.tag == 2 {
            let cell: PendingTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setPendingData(dream: presenter.getDreamAtIndexPathInPending(indexPath: indexPath))
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
