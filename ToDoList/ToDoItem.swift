//
//  ToDoItem.swift
//  ToDoList
//
//  Created by David Kuehn on 3/10/15.
//  Copyright (c) 2015 David Kuehn. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
	
	init (name: String)
	{
		itemName = name
		createDate = NSDate()
		completed = false
	}
	
	var itemName: String
	var completed: Bool
	private(set) var createDate: NSDate
}
