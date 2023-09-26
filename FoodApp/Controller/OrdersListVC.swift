//
//  OrdersListVC.swift
//  FoodApp
//
//  Created by ahmed sherif on 07/02/2023.
//

import UIKit
import ProgressHUD

class OrdersListVC: UIViewController {
    
    @IBOutlet weak var OrdersTableView: UITableView!
    
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OrdersTableView.delegate = self
        OrdersTableView.dataSource = self
        
        title = "Orders"
        registerTableViewCell()
        
        ProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self] (result) in
            switch result {
            case.success(let order):
                print("orders::: \(order)")
                ProgressHUD.dismiss()
                self?.orders = order
                self?.OrdersTableView.reloadData()
            case.failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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
