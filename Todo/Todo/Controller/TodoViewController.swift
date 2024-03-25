//
//  ViewController.swift
//  Todo
//
//  Created by Michal Pietrzak on 14/03/2024.
//

import UIKit
import CoreData

class TodoViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var itemArr = [Item]()
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        searchBar.delegate = self
        
        /// Core Data - Data Model file Path
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    //MARK: - UITableViewDataSource
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Labels.itemCell, for: indexPath)
        let item = itemArr[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        cell.tintColor = .systemYellow
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //MARK: - Update Items
        
        itemArr[indexPath.row].done = !itemArr[indexPath.row].done
        saveItems()
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Delete Items
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(itemArr[indexPath.row])
            itemArr.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: Alert.itemTitle, message: "", preferredStyle: .alert)
        let addAction = UIAlertAction(title: Alert.actionAdd, style: .default) { (action) in
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            newItem.parentCategory = self.selectedCategory
            self.itemArr.append(newItem)
            self.saveItems()
        }
        let cancelAction = UIAlertAction(title: Alert.actionCancel, style: .cancel)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = Alert.itemPlaceholder
            textField = alertTextField
        }
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Save Items
    
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
    }
    
    //MARK: - Load Items
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        
        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }
        do {
            itemArr = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        tableView.reloadData()
    }
}

//MARK: - UISearchBarDelegate

extension TodoViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        loadItems(with: request, predicate: predicate)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
