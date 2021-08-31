//
//  FavoriteVC.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 31/08/2021.
//

import UIKit

class FavoriteVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    func configureViewController() {
        title = "Favorites"
        view.backgroundColor = .systemBackground
    }
}
