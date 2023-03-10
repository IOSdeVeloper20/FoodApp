//
//  Route.swift
//  FoodApp
//
//  Created by ahmed sherif on 19/02/2023.
//

import Foundation

enum Route {
    
    static let baseURL = "https://yummie.glitch.me"
    
    case fetchAllCategories
    
    /// to make the routes acceses easily (extension for routes)
    var description: String {
        switch self {
        case .fetchAllCategories: return "/dish-categories"
        }
    }
}
