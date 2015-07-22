//
//  ViewController.swift
//  FingerprintScanning
//
//  Created by Jon Manning on 21/09/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

import LocalAuthentication

class ViewController: UIViewController {
    
    let authenticationContext = LAContext()
    
    func myButtonTapped(sender : AnyObject) {
        print("It was tapped!")
    }

    @IBAction func authenticate(sender: AnyObject) {
        
        let myRuntimeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        myRuntimeButton.addTarget(self, action: "myButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Specify how we want to authenticate. (As of iOS 8.0, the only option
        // is with the Touch ID biometric fingerprint scanner.)
        
        let policy = LAPolicy.DeviceOwnerAuthenticationWithBiometrics
        
        // Ask the system if it's possible for this authentication check to
        // succeed. (The device might not have a fingerprint scanner, or 
        // the user may not have enrolled their fingerprints, for example.)
        var error : NSError? = nil
        
        let canAuthenticate =
            authenticationContext.canEvaluatePolicy(policy, error: &error)
        
        if canAuthenticate == false {
            // If we can't use it, bail out and present an alternative way of
            // authenticating.
            println("Can't use the authentication system! \(error)")
            return
        }

        // Explain why they need to authenticate; for example:
        let authenticationReason = "You're about to spend money."
        
        // Fire off the authenticator!
        authenticationContext.evaluatePolicy(policy,
            localizedReason: authenticationReason) {
                (succeeded, error) -> Void in
            
            if succeeded {
                
                // We're in! Go ahead and perform the sensitive transaction.
                
                let alert = UIAlertController(title: "Success", message: "Success!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                
                
            } else {
                
                // Didn't work! This can happen for a number of reasons,
                // including the user canceling an incoming phone call, 
                // or choosing to enter a password instead.
                
                // Check the error code in the 'error' variable to determine
                // what the app should do next.
                
                let alert = UIAlertController(title: "Not authenticated!", message: "\(error)", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                // Some possible error codes:
                if error.code == LAError.UserFallback.rawValue {
                    // The user decided to enter a password instead of scanning
                    // her fingerprint; present a different way to authenticate.
                }
                
                if error.code == LAError.UserCancel.rawValue {
                    // The user cancelled authentication.
                }
            }
            
        }
        
        
    }
    
}

