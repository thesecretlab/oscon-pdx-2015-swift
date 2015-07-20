//
//  TableViewController.swift
//  iOSTableView
//
//  Created by Jon Manning on 6/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
   
    let data = ["Once", "upon", "a", "time"]
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView)
        -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StringCell",
                            forIndexPath: indexPath) as! UITableViewCell

        let string = data[indexPath.row]

        cell.textLabel?.text = string

        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath
                            indexPath: NSIndexPath)  {
        println("Selected \(data[indexPath.row])")
    }
    

}
