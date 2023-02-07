//
//  PopularDishesCollectionViewCell.swift
//  FoodApp
//
//  Created by ahmed sherif on 04/02/2023.
//

import UIKit

class PopularDishesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var popularDishesTitleLabel: UILabel!
    @IBOutlet weak var popularDishesImage: UIImageView!
    @IBOutlet weak var popularDishesCaloriesLabel: UILabel!
    @IBOutlet weak var popularDishesDescriptionLabel: UILabel!
    
    func setUp(popDishes: Dish) {
        popularDishesTitleLabel.text = popDishes.title
        popularDishesImage.kf.setImage(with: popDishes.image?.asUrl)
        popularDishesCaloriesLabel.text = popDishes.formatedCalories
        popularDishesDescriptionLabel.text = popDishes.description
    }
}
