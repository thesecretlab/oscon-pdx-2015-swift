//: Playground - noun: a place where people can play

import UIKit

// Working with strings
var str = "Hello, playground"

str.componentsSeparatedByString(" ")

str.uppercaseString
str.lowercaseString
str.hasPrefix("Hello")
str.hasPrefix("playground")
str.stringByReplacingOccurrencesOfString("playground", withString: "world")

str.rangeOfString("playground")
str.rangeOfString("pLaYgRoUnD", options: NSStringCompareOptions.CaseInsensitiveSearch, range: str.startIndex..<str.endIndex , locale: nil)

str.pathExtension
str.pathComponents
str.stringByAppendingPathComponent("foo")
str.stringByAppendingPathExtension("txt")
str.stringByDeletingLastPathComponent
str.stringByDeletingPathExtension

var error : NSError? = nil
str.writeToFile("/tmp/foo.txt", atomically: true, encoding: NSUTF8StringEncoding, error:&error)
if let theError = error {
    print("Error writing! \(theError)")
}
