//
//  DishDetailsVC.swift
//  FoodApp
//
//  Created by ahmed sherif on 05/02/2023.
//

import UIKit
import Kingfisher

class DishDetailsVC: UIViewController {
    
    @IBOutlet weak var DishDetailsImage: UIImageView!
    @IBOutlet weak var DishDetailsTitleLabel: UILabel!
    @IBOutlet weak var DishDetailsCaloriesLabel: UILabel!
    @IBOutlet weak var DishDetailsDescreptionLabel: UILabel!
    @IBOutlet weak var DishDetailsTextfield: UITextField!
    @IBAction func DishDetailsButton(_ sender: UIButton) {
        
    }
    
    var dish: Dish!
    
    override func viewDidLoad() {
        DishVCsetUp()
    }
    
    private func DishVCsetUp() {
        DishDetailsImage.kf.setImage(with: dish.image?.asUrl)
        DishDetailsTitleLabel.text = dish.title
        DishDetailsCaloriesLabel.text = dish.formatedCalories
        DishDetailsDescreptionLabel.numberOfLines = 3
        DishDetailsDescreptionLabel.text = dish.description
    }
}
