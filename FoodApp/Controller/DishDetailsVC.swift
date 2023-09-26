//
//  DishDetailsVC.swift
//  FoodApp
//
//  Created by ahmed sherif on 05/02/2023.
//

import UIKit
import Kingfisher
import ProgressHUD

class DishDetailsVC: UIViewController {
    
    @IBOutlet weak var DishDetailsImage: UIImageView!
    @IBOutlet weak var DishDetailsTitleLabel: UILabel!
    @IBOutlet weak var DishDetailsCaloriesLabel: UILabel!
    @IBOutlet weak var DishDetailsDescreptionLabel: UILabel!
    @IBOutlet weak var DishDetailsTextfield: UITextField!

    
    var dish: Dish!
    
    override func viewDidLoad() {
        DishVCsetUp()
    }
    
    private func DishVCsetUp() {
        DishDetailsImage.kf.setImage(with: dish.image?.asUrl)
        DishDetailsTitleLabel.text = dish.name
        DishDetailsCaloriesLabel.text = dish.formatedCalories
        DishDetailsDescreptionLabel.numberOfLines = 3
        DishDetailsDescreptionLabel.text = dish.description
    }
    
    @IBAction func PlaceOrderButton(_ sender: UIButton) {
        //check that the string is not empty or not only empty spaces
        guard let name = DishDetailsTextfield.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty
        else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("Placing Order...")
        NetworkService.shared.PlaceOrder(dishId: dish.id ?? " ", name: name) { result in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been recieved 👨🏻‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}
