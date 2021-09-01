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
        
        let containerView = UIControl(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        containerView.addTarget(self, action: #selector(goToCartVC), for: .touchUpInside)
        let imageCart = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        imageCart.image = UIImage(named: "cart")
        containerView.addSubview(imageCart)
        let searchBarButtonItem = UIBarButtonItem(customView: containerView)
        searchBarButtonItem.width = 20
        navigationItem.rightBarButtonItem = searchBarButtonItem
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
    
    @objc func goToCartVC() {
        let vc = CartVC()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
