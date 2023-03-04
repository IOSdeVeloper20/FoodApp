//
//  FoodCategoryCellInfo.swift
//  FoodApp
//
//  Created by ahmed sherif on 01/02/2023.
//

import UIKit

struct FoodCellInfo: Codable {
    let id: String?
    let title: String?
    let image: String?
    
    //we can use coding keys if we want to use our struct keys in our project with it's name while it's corresponding name in the back end will be different
    
    /* if our key was named (name) and it's corresponding is named (title) in the back end
     enum CodingKeys: String, CodingKey {
     case id= "_id"
     case name = "title"
     case image
     */
}
