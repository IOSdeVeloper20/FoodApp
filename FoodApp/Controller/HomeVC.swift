//
//  HomeVC.swift
//  FoodApp
//
//  Created by ahmed sherif on 31/01/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var FoodCategoryCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    @IBOutlet weak var SpecialDishesCollectionView: UICollectionView!
    
    //MARK: Variables
    var categories: [FoodCellInfo] = [
        .init(id: "1", title: "Food 1", image: "https://picsum.photos/100/200"),
        .init(id: "2", title: "Food 2", image: "https://picsum.photos/100/200"),
        .init(id: "3", title: "Food 3", image: "https://picsum.photos/100/200"),
        .init(id: "4", title: "Food 4", image: "https://picsum.photos/100/200"),
        .init(id: "5", title: "Food 5", image: "https://picsum.photos/100/200"),
    ]
    
    var populars: [PopDish] = [
        .init(id: "1", title: "Food 1", image: "https://picsum.photos/100/200", description: "best Food ever", calories: 120),
        .init(id: "2", title: "Food 2", image: "https://picsum.photos/100/200", description: "best Food ever", calories: 150),
        .init(id: "3", title: "Food 3", image: "https://picsum.photos/100/200", description: "best Food ever", calories: 400),
        .init(id: "4", title: "Food 4", image: "https://picsum.photos/100/200", description: "best Food ever", calories: 110),
        .init(id: "5", title: "Food 5", image: "https://picsum.photos/100/200", description: "best Food ever", calories: 320),
    ]
    
    var specials: [SpecialDish] = [
        .init(id: "1", title: "Food 1", image: "https://picsum.photos/100/200", description: "best Food ever", calories: 120),
        .init(id: "2", title: "Food 2", image: "https://picsum.photos/100/200", description: "best Food ever", calories: 150),
        .init(id: "3", title: "Food 3", image: "https://picsum.photos/100/200", description: "best Food ever", calories: 400),
    ]
    
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
    }
    
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
        case popularDishesCollectionView:
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
}
