//
//  TableVcTableViewController.swift
//  TableView-Navigation
//
//  Created by Marangi  on 29/10/2020.
//

import UIKit

class TableVC: UITableViewController {
  
  let items:[Item] = [Item(name: "Item cero", description: "descripcion item 0"),
                      Item(name: "Item uno", description: "descripcion item 1"),
                      Item(name: "Item dos", description: "descripcion item 2"),
                      Item(name: "Item tres", description: "descripcion item 3")]
  
  
  var currentDescription: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    navigationController?.navigationBar.prefersLargeTitles = true
    
    
  }
  
  // MARK: - Table view data source
  
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return items.count
  }
  
  
  //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  //        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
  //
  //     tableView(UITableView, cellForRowAt: IndexPath)
  //
  //        return cell
  //    }
  //
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier:"reusable_cell",
                                             for:indexPath)
    cell.textLabel?.text = items[indexPath.row].name
    
    return cell
  }
  
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  
  // MARK: - Navigation
  
  override func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
    
    currentDescription = items[indexPath.row].description
    performSegue(withIdentifier: "show_detail", sender: nil)
    
    
  }
  
  
  override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
    if let destinationVC = segue.destination as? DetailVC{
      destinationVC.descriptionText = currentDescription
      
}
  }
}
