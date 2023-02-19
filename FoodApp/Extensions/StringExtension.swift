//
//  StringExtension.swift
//  FoodApp
//
//  Created by ahmed sherif on 02/02/2023.
//

import Foundation

// to use a string as URL
extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
