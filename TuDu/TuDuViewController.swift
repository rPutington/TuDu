//
//  ViewController.swift
//  TuDu
//
//  Created by Randall Purington on 1/28/19.
//  Copyright © 2019 9inety4. All rights reserved.
//

import UIKit

class TuDuViewController: UITableViewController {
    var itemArray = ["Find Me", "Buy Food", "Watch a movie"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // Mark - TabelView Datacourse Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TuDuItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //Mark - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
 
        tableView.deselectRow(at: indexPath, animated: true)

    }


//MARK- Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New TuDu Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//            What will happen once user clicks the Add Item button on UIAlert
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextFeild) in alertTextFeild.placeholder = "Create new item"
            textField = alertTextFeild
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }


}

