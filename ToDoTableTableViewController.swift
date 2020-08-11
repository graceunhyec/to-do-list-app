//
//  ToDoTableTableViewController.swift
//  to do list app
//
//  Created by Grace Chang on 8/10/20.
//  Copyright © 2020 Grace Chang. All rights reserved.
//

import UIKit

class ToDoTableTableViewController: UITableViewController {
    func createToDos() -> [ToDo] {
        
        let swift = ToDo ()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "walk the dog"
        
        return [swift, dog]
        
    }
      var toDos : [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        toDos = createToDos()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }

        return cell
    }


   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let addVC = segue.destination as? AddToDoViewController {
          addVC.previousVC = self
        }
    if let completeVC = segue.destination as? CompleteToDoViewController {
           if let toDo = sender as? ToDo {
             completeVC.selectedToDo = toDo
             completeVC.previousVC = self
           }
         }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let toDo = toDos[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }

}
