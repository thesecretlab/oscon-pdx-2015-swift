//
//  ViewController.swift
//  ExternalPackages
//
//  Created by Jon Manning on 21/07/2015.
//  Copyright (c) 2015 Secret Lab. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Alamofire.request(.GET, "https://placekitten.com/g/500/500").response {
//            (request:NSURLRequest,
//            response:NSHTTPURLResponse?,
//            responseObject:AnyObject?,
//            error:NSError?) -> Void in
//            
//            switch responseObject {
//                case is NSData:
//                    println("It's data, with  \((responseObject as! NSData).length) bytes")
//                default:
//                    println("It's something else: \(responseObject.dynamicType)")
//                
//            }
//            
//        }
        
//        Alamofire.request(.GET, "https://httpbin.org/get").responseJSON(options: NSJSONReadingOptions.allZeros) { (request, response, responseObject, error) -> Void in
//            
//            if let dictionary = responseObject as? NSDictionary {
//                println("I loaded a dict! \(dictionary)")
//            }
//            
//        }
        
//        
//        Alamofire.request(.POST, "https://httpbin.org/post", parameters:["foo":"bar"], encoding: .JSON).responseJSON(options: nil) { (request, response, responseObject, error) -> Void in
//            
//            println("Received \(responseObject)")
//            
//        }
//        
//        var defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
//        defaultHeaders["X-Hello"] = "Yes"
//        
//        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
//        configuration.HTTPAdditionalHeaders = defaultHeaders
//        
//        myManager = Manager(configuration: configuration)
//        
//        myManager?.request(.GET, "https://httpbin.org/get")
//        .responseString(encoding: nil, completionHandler: { (request, response, string, error) -> Void in
//            println("Received: \(string)")
//        })
        
        
        
        
        
    }
    
    var myManager : Manager?

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

