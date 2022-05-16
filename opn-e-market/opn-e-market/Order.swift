//
//  Order.swift
//  opn-e-market
//
//  Created by Phonthep Aungkanukulwit on 16/5/2565 BE.
//

import Foundation

struct Order: Codable {
    let products: [Product]
    let deliveryAddress: String

    enum CodingKeys: String, CodingKey {
        case products
        case deliveryAddress = "delivery_address"
    }
}
