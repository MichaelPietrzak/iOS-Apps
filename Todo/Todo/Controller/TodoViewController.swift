//
//  ViewController.swift
//  Todo
//
//  Created by Michal Pietrzak on 14/03/2024.
//

import UIKit

class TodoViewController: UITableViewController {
    
    var itemArr = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        let newItem = Item()
        newItem.title = "Buy apples"
        itemArr.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Finish assignment"
        itemArr.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Clean the bathroom"
        itemArr.append(newItem3)
        
//        if let items = defaults.array(forKey: "TodoArr") as? [Item] {
//            itemArr = items
//        }
    }
    
    //MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArr[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArr[indexPath.row].done = !itemArr[indexPath.row].done
        saveItems()
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArr.append(newItem)
            self.saveItems()
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(self.itemArr)
            try data.write(to: self.dataFilePath!)
        } catch {
            print("Error encoding item arr, \(error)")
        }
    }
}

