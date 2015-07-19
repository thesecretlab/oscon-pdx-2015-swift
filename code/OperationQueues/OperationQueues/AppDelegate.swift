//
//  AppDelegate.swift
//  OperationQueues
//
//  Created by Jon Manning on 23/06/2015.
//  Copyright (c) 2015 Secret Lab. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        
        var mainQueue = NSOperationQueue.mainQueue()
        
        // Creating a new queue (will run on a background thread, probably)
        var backgroundQueue = NSOperationQueue()
        
        // See what happens when this is 2
        backgroundQueue.maxConcurrentOperationCount = 1
        
        mainQueue.addOperationWithBlock() {
            println("This operation ran on the main queue!")
        }
        
        // This runs BEFORE the line above
        backgroundQueue.addOperationWithBlock() {
            println("This operation ran on another queue!")
        }
        
        // Run code in the background, and when it's done, run code on the main queue
        backgroundQueue.addOperationWithBlock() {
            // Do some work in the background
            println("I'm on the background queue")
            
            // Schedule a block on the main queue
            mainQueue.addOperationWithBlock() {
                println("I'm on the main queue again")
                // GUI work can safely be done here.
            }
        }
        
    }



}

