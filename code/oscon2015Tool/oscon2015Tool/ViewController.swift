//
//  ViewController.swift
//  oscon2015Tool
//
//  Created by Jon Manning on 20/07/2015.
//  Copyright (c) 2015 Secret Lab. All rights reserved.
//

import UIKit

@objc
class ViewController: UIViewController {

    @IBOutlet weak var osconLabel: UILabel!
    
    var myUsefulObject : MyUsefulClass = MyUsefulClass()
    
    lazy var dateFormatter : NSDateFormatter = {
       
        let theFormatter = NSDateFormatter()
        
        theFormatter.dateStyle = .ShortStyle
        
        return theFormatter
        
    }()
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        _ = dateFormatter.dateStyle
        
        self.osconLabel.text = "Hi There"
        
        myUsefulObject = MyUsefulClass(string: "hi")
        
        
        
        
        myUsefulObject.doSomething(2, withOtherThing: 3)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("view did load")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

