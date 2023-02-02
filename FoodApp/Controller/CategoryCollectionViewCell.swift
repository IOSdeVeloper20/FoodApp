//
//  CategoryCollectionViewCell.swift
//  FoodApp
//
//  Created by ahmed sherif on 01/02/2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var CategoryImageView: UIImageView!
    @IBOutlet weak var CategoryLabel: UILabel!
    
    // Fuction to set the cell of categories
    func setUp(category: FoodCellInfo) {
        CategoryImageView.kf.setImage(with: category.image.asUrl)
        CategoryLabel.text = category.title
    }
}
