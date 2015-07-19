//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground!!"

var error : NSError?

// Aside:
// XCPSharedDataDirectoryPath returns a path to a
// symlink to ~/Documents/Shared Playground Data
// You can make paths and URLs using it!

// Finding the Documents directory

// Finding the Documents directory

var documentsDirectory = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).first as? NSURL

if let destinationURL = documentsDirectory?.URLByAppendingPathComponent("foo.txt") {
    str.writeToURL(destinationURL, atomically: true, encoding: NSUTF8StringEncoding, error: &error)
}



