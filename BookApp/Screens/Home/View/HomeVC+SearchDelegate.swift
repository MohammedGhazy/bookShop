//
//  HomeVC+SearchDelegate.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 05/08/2021.
//

import Foundation
import UIKit
extension HomeVC: UISearchResultsUpdating,UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let filter = searchController.searchBar.text {
            presenter.filterContent(for: filter)
        }
        tableView.reloadData()
    }
}
