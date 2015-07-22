//
//  ViewController.swift
//  FingerPrintScanner
//
//  Created by Jon Manning on 21/07/2015.
//  Copyright (c) 2015 Secret Lab. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    let authenticationContext = LAContext()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func authenticate(sender: AnyObject) {
        let policy = LAPolicy.DeviceOwnerAuthenticationWithBiometrics
        
        var error : NSError? = nil
        
        let canAuthenticate = authenticationContext.canEvaluatePolicy(policy, error: &error)
        if canAuthenticate == false {
            println("Cannot authenticate: \(error)")
            return
        }
        let reason = "You're about to spend money"
        
        authenticationContext.evaluatePolicy(policy, localizedReason: reason) { (succeeded, error) -> Void in
            if succeeded {
                let alert = UIAlertController(title: "Success!", message: "Yay it worked!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Failed!", message: "Aw it failed!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                if error.code == LAError.UserFallback.rawValue {
                    println("You crazy?")
                }
            }
        }
    }


}

