//
//  TabBarController.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 15/07/2021.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppreance()
        configureTabBar()
    }
    
    func configureAppreance(){
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemOrange
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title                 = title
        navController.tabBarItem.image                 = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title        = title
        return navController
    }
    
    func configureTabBar() {
        viewControllers = [
            createNavController(for: HomeVC(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: FavoriteVC(), title: NSLocalizedString("Favorites", comment: ""), image: UIImage(systemName: "star")!),
            createNavController(for: SettingVC(), title: NSLocalizedString("Setting", comment: ""), image: UIImage(systemName: "ellipsis.circle")!),
        ]
    }
    
}
