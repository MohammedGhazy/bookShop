//
//  DetailVC+Delegate.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 06/08/2021.
//

import Foundation
import UIKit
import SKActivityIndicatorView

extension DetailVC: DetailView {
    
    func showIndecator() {
        SKActivityIndicator.show()
    }
    
    func deleteIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func fetchingDataSuccess() {
        print("success")
    }
    
    func showError(error: String) {
        presentGFAlertOnMainThread(title: "Alert", message: error, buttonTitle: "Ok")
    }
    
    func addBookToCartBtnAction(book: CartItem) {
        if book.available == true {
            CartManager.instance.updateWith(cartItems: book, actionType: .add) { [weak self] error in
                guard let self  = self else { return }
                guard let error = error else {
                    self.presentGFAlertOnMainThread(title: "Success", message: "You have successfully Added book to cart 🎉.", buttonTitle: "Hooray!")
                    return
                }
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
            
        } else {
            presentGFAlertOnMainThread(title: "Alert", message: "Sorry This Book Not Avalbale Now 😞..try later", buttonTitle: "Ok")
        }
    }
}
