//
//  CartVC+TableView.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 23/08/2021.
//

import Foundation
import UIKit

extension CartVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if presenter.cartItems.isEmpty {
            self.showEmptyState(with: "Your Cart Is Empty..", in: view.self)
            billView.isHidden  = true
            tableView.isHidden = true
        } else {  }
        return presenter.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.reuseIdentifier, for: indexPath) as! CartTableViewCell
        presenter.configureCell(cell: cell, index: indexPath.row)
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = true
        cell.contentView.isUserInteractionEnabled = false
        cell.incrementButton.tag = indexPath.row
        cell.decrementButton.tag = indexPath.row
        cell.incrementButton.addTarget(self, action: #selector(incrementButtonTapped), for: .touchUpInside)
        cell.decrementButton.addTarget(self, action: #selector(decrementButtonTapped), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle  == .delete else { return }
        
        let items    = presenter.cartItems[indexPath.row]
        
        CartManager.instance.updateWith(cartItems: items, actionType: .remove) {[weak self] error in
            guard let self = self else { return }
            guard let error   = error else{
                self.presenter.cartItems.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.reloadData()
                return
            }
            self.presentGFAlertOnMainThread(title: "Unable to delete", message: error.rawValue, buttonTitle: "Ok")
        }
        billView.billLabel.text = String(presenter.returnTotal())
    }
    
    @objc func incrementButtonTapped(_ sender: UIButton) { presenter.setIncrementButton(index: sender.tag)}
    @objc func decrementButtonTapped(_ sender: UIButton) { presenter.setDecrementButton(index: sender.tag)}
}
