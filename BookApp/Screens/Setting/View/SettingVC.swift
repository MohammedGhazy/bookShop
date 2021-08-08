//
//  SettingVC.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 15/07/2021.
//

import UIKit

class SettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    

    func configureViewController() {
        title = "Setting"
        view.backgroundColor = .systemBackground
    }

}
