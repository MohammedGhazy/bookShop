//
//  MainDetail+Delegate.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 09/08/2021.
//

import Foundation

extension DetailVC: MainDetailDataView {
    
    func displayName(name: String) {
        mainDetail.bookNameLabel.text = name
    }
    
    func displayPrice(price: Double) {
        mainDetail.bookPriceLabel.text = String("\(price)$")
    }
    
    func displayAuthor(author: String) {
        otherDetail.bookAuthorLabel.text = "🖍 \(author)"
    }
    
    func displayType(type: String) {
        otherDetail.bookTypeLabel.text = "📕 \(type)"
    }
    
    func displayAvalability(avalibality: String) {
        otherDetail.bookAvalibalityLabel.text = "✂️ \(avalibality)"
    }
}
