//
//  DetailVCPresenter.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 06/08/2021.
//

import Foundation
import Alamofire

protocol DetailView: AnyObject {
    func showIndecator()
    func deleteIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    //func navigateToUserDetailsScreen(book: Book)
}

protocol DetailDataView: AnyObject {
    func displayData(author: String)
}

class DetailVCPresenter {
    
    private weak var view: DetailView?
    private var singleBookDetail: SingleBook?
    private weak var detailDataView : DetailDataView?
    
    
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
                self.detailDataView?.displayData(author: singleBook.author)
                self.view?.fetchingDataSuccess()
            }
        }
    }
    
    func setDataViewDelegate(detailDataView: DetailDataView?){
        self.detailDataView = detailDataView
    }
}
