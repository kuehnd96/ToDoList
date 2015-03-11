//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by David Kuehn on 3/10/15.
//  Copyright (c) 2015 David Kuehn. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

	private var toDoItems: NSMutableArray
	
	required init(coder aDecoder: NSCoder) {
		toDoItems = NSMutableArray()
		
		super.init(coder: aDecoder)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

		loadInitialData()
    }
	
	private func loadInitialData()
	{
		var milkItem = ToDoItem(name: "Buy Milk")
		var bookItem = ToDoItem(name: "Read a Book")
		var bandItem = ToDoItem(name: "Buy MS Band")
		
		toDoItems.addObject(milkItem)
		toDoItems.addObject(bookItem)
		toDoItems.addObject(bandItem)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.toDoItems.count
    }
	
	@IBAction func unwindToList(segue: UIStoryboardSegue)
	{
		var sourceController: AddToDoItemViewController = segue.sourceViewController as AddToDoItemViewController
		var item = sourceController.toDoItem
		
		// ?? Property in AddToDoItemViewController can't be nil for default constructor
		// So we use an empty itemName to indicate a to do item wasn't created
		if (!item.itemName.isEmpty)
		{
			self.toDoItems.addObject(item)
			
			tableView.reloadData()
		}
	}

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as UITableViewCell

		// Get the item that is diasplayed in this row
		var toDoItem: ToDoItem = self.toDoItems[indexPath.item] as ToDoItem
		
		// Set the row lable to the item name
		cell.textLabel?.text = toDoItem.itemName
		
		if (toDoItem.completed)
		{
			cell.accessoryType = UITableViewCellAccessoryType.Checkmark
		}
		else
		{
			cell.accessoryType = UITableViewCellAccessoryType.None
		}

        return cell
    }
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
		// We don't want the row to be selected in the table view
		tableView.deselectRowAtIndexPath(indexPath, animated: false)
		
		// Get the model object that was selected and update its state
		var tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as ToDoItem
		tappedItem.completed = !tappedItem.completed
		
		// Reload data for selected row
		tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
	}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
