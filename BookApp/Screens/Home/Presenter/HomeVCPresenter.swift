//
//  HomeVCPresenter.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 05/08/2021.
//

import Foundation
import Alamofire

protocol HomeView: AnyObject {
    func showIndicator()
    func deleteIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    func navigateToUserDetailsScreen(book: Book)
}

protocol HomeCellView {
    func displayName(name: String)
    func displayType(type: String)
    func displayAvailability(availability: String)
    func displayAvailabilityColor(color: UIColor)
}

class HomeVCPresenter {
    private weak var view: HomeView?
    private var booksList    = [Book]()
    private var filterList   = [Book]()
    private var searching = false
    
    init(view: HomeView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getBooks()
    }
    
    func getBooks() {
        view?.showIndicator()
        let url = "https://simple-books-api.glitch.me/books"
        APIServices.instance.getData(url: url, method: .get, params: nil, encoding: JSONEncoding.default, headers: nil) {[weak self] (bookModel: [Book]?, baseError: HomeBaseError?, error) in
            guard let self = self else { return }
            self.view?.deleteIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else if let baseError = baseError {
                print(baseError.error)
            } else {
                guard let bookModel = bookModel else { return }
                self.booksList = bookModel
                self.view?.fetchingDataSuccess()
            }
        }
    }
    
    func getUsersCount() -> Int {
        return searching ? filterList.count : booksList.count
    }
    
    func configure(cell: HomeCellView , for index: Int) {
        let books = booksList[index]
        cell.displayName(name: books.name)
        cell.displayType(type: books.type)
        if books.available == true {
            cell.displayAvailability(availability: "Avalibale")
            cell.displayAvailabilityColor(color: .green)
        } else {
            cell.displayAvailability(availability: "Not Avalibale")
            cell.displayAvailabilityColor(color: .gray)
        }

    }
    
    func didSelectRow(index: Int) {
        let book = booksList[index]
        view?.navigateToUserDetailsScreen(book: book)
    }
    
    func filterContent(for searchText: String) {
        filterList = searchText.isEmpty ? booksList :  booksList.filter {$0.name.lowercased().contains(searchText.lowercased())}
        searching = true
        print("----> \(filterList.count) <----")
    }
}
