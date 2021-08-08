//
//  UIViewController+Ext.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 13/07/2021.
//

import Foundation
import UIKit
import SafariServices


fileprivate var containerView: UIView!

extension UIViewController{
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
            
        }
    }
    
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { action in })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    func makeSafariVC(with url: URL) {
        let safariVC    = SFSafariViewController(url: url)
        
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    //    func showEmptyState(with message: String , in view: UIView){
    //        let emptyStateView     = GFEmptyState(message: message)
    //        emptyStateView.frame   = view.bounds
    //
    //        view.addSubview(emptyStateView)
    //    }
}
