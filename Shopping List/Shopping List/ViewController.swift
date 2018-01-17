//
//  ViewController.swift
//  Shopping List
//
//  Created by Caroline Nilsson on 2018-01-10.
//  Copyright © 2018 Caroline Nilsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var refresher: UIRefreshControl!

    @IBOutlet weak var shoppingListView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var shoppingListLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    var shoppingItems: [String] = []
    var amount: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        
        
        //list view seturp
        shoppingListView.delegate = self
        shoppingListView.dataSource = self
        
        //text field setup
        addItemTextField.delegate = self
        amountTextField.delegate = self
        
        scrollView.isScrollEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shoppingListView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.titleLbl.text = shoppingItems[indexPath.row]
        cell.detailLbl.text = amount[indexPath.row]
        
        return cell
    }
    
    func refresh() {
        self.shoppingListView.reloadData()
        self.refresher.endRefreshing()
        
    }
    
    @IBAction func onAddItemButtonPressed(_ sender: Any) {
        shoppingItems.append(addItemTextField.text!)
        amount.append(amountTextField.text!)
        addItemTextField.text = ""
        amountTextField.text = ""
        refresh()
        
    }
    

}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}

