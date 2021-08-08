//
//  HomeVC+PresenterDelegate.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 05/08/2021.
//

import Foundation
import SKActivityIndicatorView

extension HomeVC : HomeView {
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func deleteIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func fetchingDataSuccess() {
        tableView.reloadData()
    }
    
    func showError(error: String) {
        presentGFAlertOnMainThread(title: "Alert", message: error, buttonTitle: "Ok")
    }
    
    func navigateToUserDetailsScreen(book: Book) {
        let detailVC = DetailVC()
        detailVC.bookId = book.id
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
