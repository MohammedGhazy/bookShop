//
//  CartItem.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 25/08/2021.
//

import Foundation

struct CartItem: Codable , Equatable {
    var id           : Int
    var name         : String
    var price        : Double
    var quantity     : Int
    var total        : Double
    var available    : Bool
}
