//
//  ViewController.swift
//  ImageDownloading
//
//  Created by Jon Manning on 23/06/2015.
//  Copyright © 2015 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Reference to the image view; don't forget to set the
    // scale mode to 'Aspect Fit'
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        // Turn a string into a URL object to use
        let URLString = "http://placekitten.com/g/500/500"
        
        // Ensure that the URL is valid; if it's not, bail out
        let URL = NSURL(string: URLString)
        
        // Get the session
        let session = NSURLSession.sharedSession()
        
        // Get a data task
        let task = session.dataTaskWithURL(URL!) { (data, response, error) -> Void in
            
            // Bail out early if we got no data
            if (data == nil) {
                print("Failed to get the data! Response: \(response) Error: \(error)")
                return
            }
            
            // Try to convert the data into an image
            if let image = UIImage(data: data!) {
                
                // Now that we have an image, adding it to the image view
                // but make sure that this is done on the main queue
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.imageView.image = image
                })                
            }
        }
        
        // Tell the task to kick off
        task.resume()
        
    }

}

