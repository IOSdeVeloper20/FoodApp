//
//  UserDefaultsExtension.swift
//  FoodApp
//
//  Created by ahmed sherif on 27/09/2023.
//

import Foundation

extension UserDefaults {
    private enum UserDefaults: String {
        case hasOnboarded
    }
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaults.hasOnboarded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaults.hasOnboarded.rawValue)
        }
    }
}
