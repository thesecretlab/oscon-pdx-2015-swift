//
//  ViewController.swift
//  ImageDownloading
//
//  Created by Jon Manning on 21/07/2015.
//  Copyright (c) 2015 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBAction func downloadImage(sender: AnyObject) {
        self.spinner.startAnimating()
        
        let URLString = "http://placekitten.com/g/600/600"
        
        let URL = NSURL(string: URLString)
        
        let session = NSURLSession.sharedSession()
        
        if let theURL = URL {
            let task = session.dataTaskWithURL(theURL, completionHandler: { (data, response, error) -> Void in
                if data == nil
                {
                    println("Received no data, response: \(response) Error: \(error)")
                    return
                }
                
                if let theImage = UIImage(data: data!){
                    NSOperationQueue.mainQueue().addOperationWithBlock(){
                        self.imageView.image = theImage
                        self.spinner.stopAnimating()
                    }
                }
            })
            task.resume()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

