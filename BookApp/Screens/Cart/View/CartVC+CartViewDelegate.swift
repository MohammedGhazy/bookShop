//
//  CartVC+CartViewDelegate.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 23/08/2021.
//

import Foundation
import UIKit

extension CartVC: CartViewDelegate {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didIncrementQuantityButton(at index: Int) {
        presenter.cartItems[index].quantity += 1
        reloadData()
        billView.billLabel.text = String(presenter.returnTotal())
        _ = CartManager.instance.saveItems(cartItems: presenter.cartItems)
    }
    
    func didDecrementQuantityButton(at index: Int) {
        let items = presenter.cartItems[index]
        if items.quantity == 1 {
            presenter.cartItems.remove(at: index)
            CartManager.instance.updateWith(cartItems: items, actionType: .remove) {[weak self] error in
                guard let self = self else { return }
                guard let error = error else { return }
                self.presentGFAlertOnMainThread(title: "Alert", message: "Unable to delete", buttonTitle: "ok")
                print(error.rawValue)
            }
        }else {
            presenter.cartItems[index].quantity -= 1
        }
        billView.billLabel.text = String(presenter.returnTotal())
        reloadData()
        _ = CartManager.instance.saveItems(cartItems: presenter.cartItems)
    }
}

