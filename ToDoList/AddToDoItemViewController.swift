//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by David Kuehn on 3/10/15.
//  Copyright (c) 2015 David Kuehn. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {

	required init(coder aDecoder: NSCoder) {
		self.toDoItem = ToDoItem(name: "") // This NEEDS a value here
		
		super.init(coder: aDecoder)
	}
	
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
	var toDoItem: ToDoItem
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		
		if (sender as UIBarButtonItem == self.saveButton)
		{
			if (!self.textField.text.isEmpty)
			{
				self.toDoItem = ToDoItem(name: self.textField.text)
				self.toDoItem.completed = false
			}
		}
    }

}
