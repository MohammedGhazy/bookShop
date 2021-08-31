//
//  DetailVCPresenter.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 06/08/2021.
//

import Foundation
import Alamofire
import UIKit

protocol DetailView: AnyObject {
    func showIndecator()
    func deleteIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    func addBookToCartBtnAction(book: CartItem)
}

protocol MainDetailDataView: AnyObject {
    func displayName(name: String)
    func displayPrice(price: Double)
    func displayAuthor(author: String)
    func displayType(type: String)
    func displayAvalability(avalibality: String)
}

class DetailVCPresenter {
    
    private weak var view: DetailView?
    private var singleBookDetail: SingleBook?
    private weak var detailDataView : MainDetailDataView?
    private var booksList    = [Book]()
    
    init(view: DetailView) {
        self.view  = view
    }
    
    func getSingleBook(id: Int) {
        view?.showIndecator()
        let url = "https://simple-books-api.glitch.me/books/\(id)"
        APIServices.instance.getData(url: url, method: .get, params: nil, encoding: JSONEncoding.default, headers: nil) { [weak self] (singleBook: SingleBook?, baseError: HomeBaseError?, error) in
            guard let self = self else { return }
            self.view?.deleteIndicator()
            
            if let error = error {
                print(error)
            } else if let baseError = baseError {
                print(baseError)
            } else {
                guard let singleBook = singleBook else { return }
                self.singleBookDetail = singleBook
                self.detailDataView?.displayName(name: singleBook.name)
                self.detailDataView?.displayPrice(price: singleBook.price)
                self.detailDataView?.displayAuthor(author: singleBook.author)
                self.detailDataView?.displayType(type: singleBook.type)
                self.detailDataView?.displayAvalability(avalibality: singleBook.available ? "Avalibale Now" : "Not Avalibale")
                self.view?.fetchingDataSuccess()
            }
        }
    }
    
    func setDataViewDelegate(detailDataView: MainDetailDataView?){
        self.detailDataView = detailDataView
    }
    
    func setAddBookToCartBtnAction() {
        let cartItems = CartItem(
            id: singleBookDetail!.id,
            name: singleBookDetail!.name,
            price: singleBookDetail!.price,
            quantity: 1,
            total: 0.0,
            available: singleBookDetail!.available
        )
        view?.addBookToCartBtnAction(book: cartItems)
        print(cartItems.quantity)
    }
}
