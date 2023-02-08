//
//  OrdersListVC.swift
//  FoodApp
//
//  Created by ahmed sherif on 07/02/2023.
//

import UIKit

class OrdersListVC: UIViewController {
    
    @IBOutlet weak var OrdersTableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "1", personName: "Ahmed", dish: .init(id: "1", title: "Popular Food 1", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever", calories: 120)),
        .init(id: "2", personName: "Mayar", dish: .init(id: "2", title: "Popular Food 2", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever", calories: 120)),
        .init(id: "3", personName: "Aya", dish: .init(id: "3", title: "Popular Food 3", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever", calories: 120)),
        .init(id: "4", personName: "Raghad", dish: .init(id: "4", title: "Popular Food 4", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever", calories: 120)),
        .init(id: "5", personName: "Sherif", dish: .init(id: "5", title: "Popular Food 5", image: "https://pngimg.com/d/pasta_PNG53.png", description: "best Food ever", calories: 120))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OrdersTableView.delegate = self
        OrdersTableView.dataSource = self
        
        title = "Orders"
        registerTableViewCell()
    }
    
//MARK: Functions
    //Function that register the XIB cell
    /*UINib: the name of nib cell file
     forCellReuseIdentifier: the id that is set for the cell*/
    private func registerTableViewCell() {
        OrdersTableView.register(UINib(/*nibName must be the real name of Xib file*/nibName: Constants.CategoriesTableView_ID, bundle: nil), forCellReuseIdentifier: Constants.CategoriesTableView_ID)
    }
    
}

extension OrdersListVC: UITableViewDelegate, UITableViewDataSource {
    //number of cells in tablView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    /*withIdentifier: the id that is set for the cell
     as >> the name of the controller class*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OrdersTableView.dequeueReusableCell(withIdentifier: Constants.CategoriesTableView_ID, for: indexPath) as! CategoryListTableViewCell
        //pass the data to the cell 
        cell.orderSetUp(orders: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DishDetailsVC.instatiate()
        //pass the data to be set in DishDetailsVC
        vc.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(vc, animated: true)
    }
}
