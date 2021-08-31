//
//  CartVCPresenter.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 23/08/2021.
//

import Foundation
import UIKit

protocol CartViewDelegate: AnyObject {
    func showEmptyCart()
    func didIncrementQuantityButton(at index: Int)
    func didDecrementQuantityButton(at index: Int)
}

protocol CartCellView {
    func displayName(name: String)
    func displayPrice(price: String)
    func displayQuantity(counter: Int)
}

protocol CartBillDelegate: AnyObject {
    func displayBill(bill: String)
}

class CartVCPresenter {
    
    private weak var view: CartViewDelegate?
    private weak var cartBillDelegate: CartBillDelegate?
    var cartItems = CartManager.instance.items
    
    init(view: CartViewDelegate) {
        self.view = view
    }
    
    func configureCell(cell: CartCellView,index: Int) {
        cell.displayName(name: cartItems[index].name)
        cell.displayPrice(price: "\(self.returnItemPrice(cartItems: cartItems[index])) $")
        cell.displayQuantity(counter: cartItems[index].quantity)
    }
    
    func setIncrementButton(index: Int) {
        view?.didIncrementQuantityButton(at: index)
    }
    
    func setDecrementButton(index: Int) {
        view?.didDecrementQuantityButton(at: index)
    }
    
    func setBillDelegate(cartBillDelegate: CartBillDelegate?) {
        self.cartBillDelegate = cartBillDelegate
    }
    
    func getCartItems() {
        CartManager.instance.reteriveCartItems {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items) :
                if items.isEmpty {
                    print("No Items")
                    self.view?.showEmptyCart()
                } else {
                    self.cartItems = items
                    _ = self.returnTotal()
                    self.cartBillDelegate?.displayBill(bill: "\(self.returnTotal())")
                }
            case .failure(let error) :
                print(error.rawValue)
            }
        }
    }
    
    func returnTotal() -> Double {
        var sum = 0.0
        cartItems.forEach { item in
            sum = sum + (item.price * Double(item.quantity))
        }
        print("sum is ---> \(sum)")
        return sum
    }
    
    func returnItemPrice(cartItems: CartItem) -> Double {
        var total: Double = 0.0
        total = cartItems.price * Double(cartItems.quantity)
        return total
    }
}
