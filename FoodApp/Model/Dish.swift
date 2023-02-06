//
//  PopDish.swift
//  FoodApp
//
//  Created by ahmed sherif on 04/02/2023.
//

import Foundation


struct Dish {
    let id, title, image, description: String?
    let calories: Int?
    
    var formatedCalories: String {
        return "\(calories ?? 0) cal"
    }
}
