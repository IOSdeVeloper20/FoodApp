//
//  CategoryListTableViewCell.swift
//  FoodApp
//
//  Created by ahmed sherif on 07/02/2023.
//

import UIKit

class CategoryListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var TableViewCellImage: UIImageView!
    @IBOutlet weak var tableViewCellTitleLabel: UILabel!
    @IBOutlet weak var TableViewCellDescriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     func tableViewSetUp(dish: Dish) {
        TableViewCellImage.kf.setImage(with: dish.image?.asUrl)
        tableViewCellTitleLabel.text = dish.name
        TableViewCellDescriptionLabel.text = dish.description
    }
    
    func orderSetUp(orders: Order) {
        TableViewCellImage.kf.setImage(with: orders.dish?.image?.asUrl)
        tableViewCellTitleLabel.text = orders.dish?.name
        TableViewCellDescriptionLabel.text = orders.name
    }
}
