//
//  Store.swift
//  opn-e-market
//
//  Created by Phonthep Aungkanukulwit on 16/5/2565 BE.
//

import Foundation

struct Store: Codable {
    let name: String
    let rating: Double
    let openingTime, closingTime: String
}
