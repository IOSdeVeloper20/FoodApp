//
//  SpecialDishCollectionViewCell.swift
//  FoodApp
//
//  Created by ahmed sherif on 05/02/2023.
//

import UIKit

class SpecialDishCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var SpecialDishesImage: UIImageView!
    @IBOutlet weak var SpecialDishesTitleLabel: UILabel!
    @IBOutlet weak var SpecialDishesDescriptionLabel: UILabel!
    @IBOutlet weak var SpecialDishesCaloriesLabel: UILabel!
    
    func setUp(specialDishes: Dish) {
        SpecialDishesImage.kf.setImage(with: specialDishes.image?.asUrl)
        SpecialDishesTitleLabel.text = specialDishes.name
        SpecialDishesDescriptionLabel.text = specialDishes.description
        SpecialDishesCaloriesLabel.text = specialDishes.formatedCalories
    }
}
