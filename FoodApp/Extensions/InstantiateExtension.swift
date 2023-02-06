//
//  InstantiateExtension.swift
//  FoodApp
//
//  Created by ahmed sherif on 06/02/2023.
//

import UIKit

extension UIViewController {
    
    static var ID: String {
        return String(describing: self)
    }
    
    static func instatiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: ID) as! Self
    }
}
