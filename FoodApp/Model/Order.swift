//
//  Order.swift
//  FoodApp
//
//  Created by ahmed sherif on 07/02/2023.
//

import Foundation

struct Order: Codable {
    let id, name: String?
    let dish: Dish?
}
