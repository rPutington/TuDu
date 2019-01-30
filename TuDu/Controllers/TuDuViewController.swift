//
//  ViewController.swift
//  TuDu
//
//  Created by Randall Purington on 1/28/19.
//  Copyright © 2019 9inety4. All rights reserved.
//

import UIKit

class TuDuViewController: UITableViewController {
    
  
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Me"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Food"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Study"
        itemArray.append(newItem3)
        
   
        if let items  = defaults.array(forKey: "TuDuListArray") as? [Item] {
            itemArray = items
        }
    }
    // Mark - TabelView Datacourse Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TuDuItemCell", for: indexPath)
        
//----------------------------------------------------------------------------------
        

        cell.textLabel?.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
        cell.accessoryType = . none
            
}
        
        
        return cell
    }
    
    //Mark - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
          
        
        tableView.reloadData()
        
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
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TuDuListArray")
            
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextFeild) in alertTextFeild.placeholder = "Create new item"
            textField = alertTextFeild
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }


}

