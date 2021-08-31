//
//  CartBillDelegate.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 31/08/2021.
//

import Foundation
import UIKit

extension CartVC: CartBillDelegate {
    
    func displayBill(bill: String) {
        billView.billLabel.text = bill
    }
}
