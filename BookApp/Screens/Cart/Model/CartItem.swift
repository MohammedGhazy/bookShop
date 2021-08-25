//
//  CartItem.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 25/08/2021.
//

import Foundation

struct CartItem: Codable , Equatable {
    let id           : Int
    let name         : String
    let price        : Double
    var quantity     : Int
    let amount       : Double
    let available    : Bool
}
