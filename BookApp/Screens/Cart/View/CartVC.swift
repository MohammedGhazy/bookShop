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
        tableView.rowHeight = 140
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    let billView = BillView()
    
    var presenter: CartVCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("array count in manager \(CartManager.instance.items.count)")
        presenter = CartVCPresenter(view: self)
        presenter.setBillDelegate(cartBillDelegate: self)
        configureViewController()
        configureTableView()
        configureBillView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getCartItems()
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
    
    func configureBillView() {
        view.addSubview(billView)
        NSLayoutConstraint.activate([
            billView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            billView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            billView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            billView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
}
