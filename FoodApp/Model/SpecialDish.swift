//
//  SpecialDish.swift
//  FoodApp
//
//  Created by ahmed sherif on 05/02/2023.
//

import Foundation


struct SpecialDish {
    let id, title, image, description: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) cal"
    }
}
