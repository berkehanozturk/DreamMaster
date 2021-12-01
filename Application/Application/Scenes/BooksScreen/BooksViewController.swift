//
//  BooksViewController.swift
//  Application
//
//  Created by Berkehan on 24.11.2021.
//

import UIKit
import Core
import UIComponents
protocol BooksRouter: AnyObject {
    
}

protocol BooksView: AnyObject {
    
}

class BooksViewController: BaseViewController, UIGestureRecognizerDelegate {
    
     lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search For Words"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchBarStyle = .default
        searchController.searchBar.delegate = self

        return searchController
    }()
    
    var presenter = BooksPresenter()
    @IBOutlet weak var wordListTableView: UITableView!
    var searchedArray: [DreamListSection] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        prepareSections()
        wordListTableView.layoutIfNeeded()
        searchedArray = presenter.dreamListSections
        self.wordListTableView.reloadData()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        customizeNavbar()

    }
    
    private func setupTableView() {
        wordListTableView.translatesAutoresizingMaskIntoConstraints = false
        wordListTableView.delegate = self
        wordListTableView.dataSource = self
        wordListTableView.register(ListTableViewCell.self)
        wordListTableView.layoutIfNeeded()
    }
  
    func prepareSections() {
       presenter.prepareSections()
    }
}

extension BooksViewController: BooksView {
    
}

extension BooksViewController: BooksRouter {
    
}
extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchedArray[section].dreamWords.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return searchedArray.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return searchedArray.map {$0.letter}
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return searchedArray[section].letter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let section = searchedArray[indexPath.section]
        let dreamWord = section.dreamWords[indexPath.row]
        cell.setData(word: dreamWord)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = searchedArray[indexPath.section]
        let selectedDream  = section.dreamWords[indexPath.row]
    }
    
}
extension BooksViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedArray = []
        let sections = presenter.getDreamListSections()
        if searchText.isEmpty {
            searchedArray = presenter.getDreamListSections()
        }
        for section in sections {
            for dream in section.dreamWords {
                guard let dreamTitle = dream.dreamWordTitle else { return }
                if dreamTitle.lowercased().contains(searchText.lowercased()) {
                    searchedArray.append(section)
                }
            }
        }
        self.wordListTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchedArray = presenter.getDreamListSections()
        self.wordListTableView.reloadData()

    }
}

extension BooksViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension BooksViewController: NavbarCustomizable {
    func customizeNavbar() {
        print(searchController)
        navigationItem.searchController = searchController
        navigationItem.title = "Dream Master"
    }
}
