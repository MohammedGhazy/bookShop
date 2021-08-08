//
//  HomeVC.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 13/07/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.rowHeight = 140
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    var presenter: HomeVCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HomeVCPresenter(view: self)
        presenter.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureTableView()
    }
    
    func configureViewController() {
        title = "Home"
        view.backgroundColor = .systemBackground
    }
    
    func configureSearchController(){
        let searchController = UISearchController()
        searchController.searchResultsUpdater    = self
        searchController.searchBar.delegate      = self
        searchController.searchBar.placeholder = "Search For A book."
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController        = searchController
    }
    
    
    func configureTableView() {
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
