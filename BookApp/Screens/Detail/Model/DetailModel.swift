//
//  DetailModel.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 15/07/2021.
//

import Foundation

struct SingleBook: Codable {
    let id           : Int
    let name         : String
    let author       : String
    let type         : String
    let available    : Bool
    let price        : Double
    let currentStock : Int?
}
