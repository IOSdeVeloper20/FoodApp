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
    case placeOrder(String)
    case fetchCategoryDishes(String)
    case fetchOrders
    
    /// to make the routes acceses easily (extension for routes)
    var description: String {
        switch self {
        case .fetchAllCategories: return "/dish-categories"
        case .placeOrder(let dishId): return "/orders/\(dishId)"
        case .fetchCategoryDishes(let categoryId): return "/dishes/\(categoryId)"
        case .fetchOrders: return "/orders"
        }
    }
}
