//
//  UITableView+Ext.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 08/08/2021.
//

import Foundation
import UIKit

extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}
