//
//  TableViewListViewController.swift
//  FoodApp
//
//  Created by ahmed sherif on 07/02/2023.
//

import UIKit

class TableViewListVC: UIViewController {

//MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!

//MARK: Variables
    
    var category: FoodCellInfo!
    
    var dishes: [Dish] = [
        .init(id: "1", name: "Popular Food 1", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever", calories: 120),
        .init(id: "2", name: "Popular Food 2", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever", calories: 150),
        .init(id: "3", name: "Popular Food 3", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever", calories: 400),
        .init(id: "4", name: "Popular Food 4", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever", calories: 110),
        .init(id: "5", name: "Popular Food 5", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever best Food ever best Food ever best Food ever best Food ever best Food ever best Food ever best Food ever", calories: 320)
    ]

//MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = category.title
        registerTableViewCell()
    }
    
//MARK: Functions
    //Function that register the XIB cell
    /*UINib: the name of nib cell file
     forCellReuseIdentifier: the id that is set for the cell*/
    private func registerTableViewCell() {
        tableView.register(UINib(/*nibName must be the real name of Xib file*/nibName: Constants.CategoriesTableView_ID, bundle: nil), forCellReuseIdentifier: Constants.CategoriesTableView_ID)
    }
}


//MARK: Extension
extension TableViewListVC: UITableViewDataSource, UITableViewDelegate {
    // number of cells to be returned
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    //what each cell will display
    /*withIdentifier: the id that is set for the cell
     as >> the name of the controller class*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CategoriesTableView_ID, for: indexPath) as! CategoryListTableViewCell
        cell.tableViewSetUp(dish: dishes[indexPath.row])
        return cell
    }
    
    //when any cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DishDetailsVC.instatiate()
        vc.dish = dishes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
