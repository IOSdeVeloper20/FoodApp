//
//  APIResponse.swift
//  FoodApp
//
//  Created by ahmed sherif on 03/03/2023.
//

import Foundation

struct APIResponse <T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
