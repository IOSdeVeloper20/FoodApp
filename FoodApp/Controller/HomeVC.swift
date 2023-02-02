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
    
    //MARK: Variables
    var categories: [FoodCellInfo] = [
        .init(id: "1", title: "Food 1", image: "https://picsum.photos/100/200"),
        .init(id: "2", title: "Food 2", image: "https://picsum.photos/100/200"),
        .init(id: "3", title: "Food 3", image: "https://picsum.photos/100/200"),
        .init(id: "4", title: "Food 4", image: "https://picsum.photos/100/200"),
        .init(id: "5", title: "Food 5", image: "https://picsum.photos/100/200"),
    ]
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodCategoryCollectionView.dataSource = self
        FoodCategoryCollectionView.delegate = self
        registerXibCell()
    }

    //function manually register for cell
    private func registerXibCell () {
        FoodCategoryCollectionView.register(UINib(/*nibName must be the real name of Xib file*/nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.CategoryCell_ID)
    }
}

//MARK: Extension
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CategoryCell_ID, for: indexPath) as! CategoryCollectionViewCell
        return cell
    }
}
