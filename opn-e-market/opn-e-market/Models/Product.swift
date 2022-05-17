//
//  Product.swift
//  opn-e-market
//
//  Created by Phonthep Aungkanukulwit on 16/5/2565 BE.
//

import Foundation

struct Products: Codable {
    let products: [Product]
}

struct Product: Codable {
    let name: String
    let price: Int
    let imageUrl: String
}
