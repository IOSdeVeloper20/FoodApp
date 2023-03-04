//
//  AllDishes.swift
//  FoodApp
//
//  Created by ahmed sherif on 04/03/2023.
//

import Foundation

struct AllDishes: Codable {
    let categories: [FoodCellInfo]?
    let populars: [Dish]?
    let specials: [Dish]?
}
