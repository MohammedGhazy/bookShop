//
//  CartVCPresenter.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 23/08/2021.
//

import Foundation

protocol CartViewDelegate: AnyObject {
    func didIncrementQuantityButton(at index: Int)
    func didDecrementQuantityButton(at index: Int)
}

protocol CartCellView {
    func displayName(name: String)
    func displayPrice(price: String)
    func displayCounter(counter: Int)
}

class CartVCPresenter {
    
    private weak var view: CartViewDelegate?
    var cartItems = [CartItem]()
    
    init(view: CartViewDelegate) {
        self.view = view
    }
    
    func configureCell(cell: CartCellView,index: Int) {
        cell.displayName(name: cartItems[index].name)
        cell.displayPrice(price: "\(cartItems[index].price) $")
        cell.displayCounter(counter: cartItems[index].quantity)
    }
    
    func setIncrementButton(index: Int) {
        view?.didIncrementQuantityButton(at: index)
    }
    
    func setDecrementButton(index: Int) {
        view?.didDecrementQuantityButton(at: index)
    }
    
    func getCartItems() {
        CartManager.instance.reteriveCartItems {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items) :
                if items.isEmpty {
                    print("No Items")
                } else {
                    self.cartItems = items
                }
            case .failure(let error) :
                print(error.rawValue)
            }
        }
    }
    
}
