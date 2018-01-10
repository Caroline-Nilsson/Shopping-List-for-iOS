//
//  ViewController.swift
//  Shopping List
//
//  Created by Caroline Nilsson on 2018-01-10.
//  Copyright © 2018 Caroline Nilsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var shoppingListView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var shoppingListLabel: UILabel!
    
    var shoppingItems: [String] = ["sallad", "tomater", "gurka"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //list view seturp
        shoppingListView.delegate = self
        shoppingListView.dataSource = self
        
        //text field setup
        addItemTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shoppingListView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = shoppingItems[indexPath.row]
        return cell!
    }
    @IBAction func onAddItemButtonPressed(_ sender: Any) {
        shoppingItems.append(addItemTextField.text!)
    }
    

}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}

