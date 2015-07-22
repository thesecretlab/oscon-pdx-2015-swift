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
        
        let db = Database()
        
        let users = db["users"]
        
        let id = Expression<Int64>("id")
        let name = Expression<String>("name")
        let email = Expression<String>("email")
        
        db.create(table: users, ifNotExists:true) {
            t in
            t.column(id, primaryKey:true)
            t.column(name)
            t.column(email, unique:true)
        }
        
        var alice : Query?
        
        if let rowID = users.insert(name <- "Alice", email <- "alice@mac.com").rowid {
            
            alice = users.filter(id == rowID)
            
        }
        
        for user in users {
            println("User: id: \(user[id]), name:\(user[name])")
        }
        
        let sql = alice?.update(email <- replace(email, "mac.com", "me.com")).statement.description
        println(sql)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

