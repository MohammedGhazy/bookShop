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
    
    
}
