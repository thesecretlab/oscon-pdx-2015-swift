//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

do {
    
    try "foo".writeToFile("/invalid/path", atomically: true, encoding: NSUTF8StringEncoding)
    
} catch var error as NSError {
    
    print("There was a problem: \(error.description)")
    
}


func testGuard() {
    let myOptionalString  : String? = "foo"

    guard myOptionalString != nil else {
        
        print("I can't continue!")
        
        return
    }
}

let myMemory = malloc(400)

defer {
    free(myMemory)
}


/* do something with myMemory */











