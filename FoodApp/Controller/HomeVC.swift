//
//  HomeVC.swift
//  FoodApp
//
//  Created by ahmed sherif on 31/01/2023.
//

import UIKit
import ProgressHUD

class HomeVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var FoodCategoryCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    @IBOutlet weak var SpecialDishesCollectionView: UICollectionView!
    
    //MARK: Variables
    var categories: [FoodCellInfo] = []
    var populars: [Dish] = []
    var specials: [Dish] = []
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        FoodCategoryCollectionView.dataSource = self
        FoodCategoryCollectionView.delegate = self
        popularDishesCollectionView.dataSource = self
        popularDishesCollectionView.delegate = self
        SpecialDishesCollectionView.dataSource = self
        SpecialDishesCollectionView.delegate = self
        registerXibCell()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.FoodCategoryCollectionView.reloadData()
                self?.popularDishesCollectionView.reloadData()
                self?.SpecialDishesCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
//MARK: Functions
    //function manually register for cell
    private func registerXibCell () {
        FoodCategoryCollectionView.register(UINib(/*nibName must be the real name of Xib file*/nibName: Constants.CategoryCell_ID, bundle: nil), forCellWithReuseIdentifier: Constants.CategoryCell_ID)
        popularDishesCollectionView.register(UINib(/*nibName must be the real name of Xib file*/nibName: Constants.PopularDishesCell_ID, bundle: nil), forCellWithReuseIdentifier: Constants.PopularDishesCell_ID)
        SpecialDishesCollectionView.register(UINib(/*nibName must be the real name of Xib file*/nibName: Constants.SpecialDishesCell_ID, bundle: nil), forCellWithReuseIdentifier: Constants.SpecialDishesCell_ID)
    }
}

//MARK: Extension
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case FoodCategoryCollectionView:
            return categories.count
        case popularDishesCollectionView:
            return populars.count
        case SpecialDishesCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // to set or send data to setup function in cell to be shown
        switch collectionView {
        case FoodCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CategoryCell_ID, for: indexPath) as! CategoryCollectionViewCell
            cell.setUp(category: categories[indexPath.row])
            return cell
        case popularDishesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PopularDishesCell_ID, for: indexPath) as! PopularDishesCollectionViewCell
            cell.setUp(popDishes: populars[indexPath.row])
            return cell
        case SpecialDishesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.SpecialDishesCell_ID, for: indexPath) as! SpecialDishCollectionViewCell
            cell.setUp(specialDishes: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    //when the item is selected or tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == FoodCategoryCollectionView {
            let vc = TableViewListVC.instatiate()
            // send the data to set the title of vc(TableViewVC) controller only
            vc.category = categories[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = DishDetailsVC.instatiate()
            // check which collection view is targeted and show it's information
            vc.dish = collectionView == popularDishesCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
