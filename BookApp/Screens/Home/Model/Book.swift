//
//  Book.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 13/07/2021.
//

import Foundation

struct Book: Codable,Equatable {
    let id        : Int
    let name      : String
    let type      : String
    let available : Bool
}
