//
//  CartVC+CartViewDelegate.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 23/08/2021.
//

import Foundation
import UIKit

extension CartVC: CartViewDelegate {
    
    func didIncrementQuantityButton(at index: Int) {
        presenter.cartItems[index].quantity+=1
        print(presenter.cartItems[index].quantity)
    }
    
    func didDecrementQuantityButton(at index: Int) {
        if presenter.cartItems.count == 0 {
            CartManager.instance.updateWith(cartItems: presenter.cartItems[index], actionType: .remove) {[weak self] error in
                guard let self = self else { return }
                guard let error   = error else{ return }
                self.presentGFAlertOnMainThread(title: "Unable to delete", message: error.rawValue, buttonTitle: "Ok")
            }
        } else {
            presenter.cartItems[index].quantity-=1
        }
    }
}


