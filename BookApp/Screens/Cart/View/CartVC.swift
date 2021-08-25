//
//  CartVC.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 15/07/2021.
//

import UIKit

class CartVC: UIViewController {
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.rowHeight = 140
        tableView.isUserInteractionEnabled = true
        tableView.delaysContentTouches     = false
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    var presenter: CartVCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CartVCPresenter(view: self)
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getCartItems()
        tableView.reloadData()
    }
    
    
    func configureViewController() {
        title = "cart"
        view.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}
