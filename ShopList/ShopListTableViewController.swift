//
//  ShopListTableViewController.swift
//  ShopList
//
//  Created by Rustam Gradov on 22/05/2019.
//  Copyright © 2019 Rustam Gradov. All rights reserved.
//

import UIKit
import CoreData

class ShopListTableViewController: UITableViewController, NewItemViewControllerDelegate {
    
    @IBOutlet var shopListTableView: UITableView!
    
    var items: [Items] = []
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopListTableView.dataSource = self
        shopListTableView.delegate = self
        
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .medium
        
        let request = NSFetchRequest<Items>(entityName: "Items")
        //выполняем
        let results = try! CoreDataHelper.shared.container.viewContext.fetch(request)
        self.items = results
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopListTableViewCell", for: indexPath) as! ShopListTableViewCell
        
        let item = items[indexPath.row]
        cell.labelItem.text = item.itemTitle
        cell.labelPieces.text = String(Int(item.count))
        cell.labelDate.text = dateFormatter.string(from: item.date)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let indexToDelete = indexPath.row
        //удаляем из массива
        let item = items.remove(at: indexToDelete)
        
        shopListTableView.deleteRows(at: [indexPath], with: .automatic)
        
        
        CoreDataHelper.shared.container.viewContext.delete(item)
        
        try? CoreDataHelper.shared.container.viewContext.save()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? NewItemViewController {
            controller.delegate = self
        }
    }
    func itemCreated(_ item: Items) {
        items.append(item)
        tableView.reloadData()
        
        dismiss(animated: true, completion: nil)
        
        try? CoreDataHelper.shared.container.viewContext.save()
    }
}
