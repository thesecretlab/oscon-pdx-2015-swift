//
//  ViewController.swift
//  ExternalPackages
//
//  Created by Jon Manning on 18/07/2015.
//  Copyright (c) 2015 Secret Lab. All rights reserved.
//

import UIKit
import Alamofire
import SQLite

class ViewController: UIViewController {
    
    var myManager : Alamofire.Manager?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request(.GET, "http://placekitten.com/g/100/100")
            
            .response { (request:NSURLRequest, response:NSURLResponse?, responseObject:AnyObject?, error:NSError?) in
            
            switch responseObject {
            case is NSData:
                println("It's data!")
            default:
                println("It's a \(responseObject.dynamicType)")
            }
            
        }
        
        // Getting JSON
        Alamofire.request(.GET, "http://httpbin.org/get").responseJSON(options: NSJSONReadingOptions.allZeros) { (request:NSURLRequest, response : NSURLResponse?, responseJSON:AnyObject?, error:NSError?) -> Void in
            
            if let dict = responseJSON as? NSDictionary {
                println("Loaded dict: \(dict)")
            }
            
        }
        
        // POST to a URL, encoding the parameters as JSON, and receive JSON back
        Alamofire.request(.POST, "http://httpbin.org/post", parameters:["foo":"bar"], encoding: .JSON).responseJSON(options: .AllowFragments) { (request, response, responseJSON, error) -> Void in
            if let dict = responseJSON as? NSDictionary {
                println("Posted, returned dict: \(dict)")
            }
        }
        
        // Create a manager, configure it to send a header, and make a request
        var defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        defaultHeaders["X-Hello"] = "Yes"
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = defaultHeaders
        
        myManager = Manager(configuration: configuration)
        myManager?.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
            .responseString(encoding: nil) { (request, response, responseString, error) -> Void in
                println("Manager loaded: \(responseString)")
            }
        
        
        // Pass a string to open a database file, or leave empty
        // to create an in-memory database that gets dropped when the 
        // object leaves scope
        let db = Database()
        
        // Start a query that deals with a table called "users"
        let users = db["users"]
        
        // Define expressions that we'll use in this query, 
        // as well as their corresponding types
        let id = Expression<Int64>("id")
        let name = Expression<String>("name")
        let email = Expression<String>("email")
        
        // Tell SQLite to create the table:
        // - if it doesn't already exist
        // - and describe the columns
        db.create(table: users, ifNotExists: true) {
            t in
            t.column(id, primaryKey:true)
            t.column(name)
            t.column(email, unique:true)
        }
        
        // Start a new, empty query
        var alice : Query?
        
        // Try to insert a row in the users column, and get the row ID from that
        // Equivalent to INSERT INTO users (name, email) VALUES ("Alice", "alice@mac.com")
        if let rowID = users.insert(name <- "Alice", email <- "alice@mac.com").rowid {
            println("inserted: \(rowID)")
            
            // Set up the query to be limited to this new row
            alice = users.filter(id == rowID)
        }
        
        // Loop over everything in the users query (equivalent to SELECT * FROM users)
        for user in users {
            println("id: \(user[id]), name: \(user[name]), email: \(user[email])")
            
        }
        
        // Using the alice query (which is limited to the row that we inserted earlier),
        // update the email column by replacing "mac.com" with "me.com"
        // Equivalent to UPDATE "users" SET "email" = replace("email", "mac.com", "me.com") WHERE ("id" = rowID)
        let sql = alice?.update(email <- replace(email, "mac.com", "me.com")).statement.description
        
        // Getting a single value from the database
        let count = db.scalar("SELECT COUNT(*) FROM users")
        
        if let count = count as? Int64 {
            println("Count: \(count)")
        }
        
        // Execute a raw SQL statement
        for row in db.prepare("SELECT id, email FROM users") {
            println("Email: \(row[1])")
        }
        
        // Delete everything matching the query
        // Equivalent to DELETE FROM "users" WHERE id = rowID
        alice?.delete()
        
        
        // Get the number of rows matching the query
        // Equivalent to SELECT COUNT(*) FROM "users"
        users.count
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

