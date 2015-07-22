//: Playground - noun: a place where people can play

import UIKit

var arrayOfInts = [1,2,4,8]


var theSameArray = arrayOfInts

arrayOfInts[1] = 42

arrayOfInts

theSameArray


typealias GroceryType = (name: String, price: Float, averageRating:Int)

var grocery : GroceryType = ("Beans", 1.99, 2)
grocery.0
grocery.1

grocery.name

for number in arrayOfInts {
    println("Number: \(number)")
}

var niftyDictionary = [
    "Greeting":"hello",
    "Farewell":"goodbye"
]

for (key, value) in niftyDictionary {
    println("Key: \(key) = Value: \(value)")
}

var numberDictionary = [
    1: "one",
    2: "two",
    "boop":"yes"
]

var mySet : Set = [1,2,3,4,3]

var number = 1

if ("one".uppercaseString == "ONE") {
    println("Hi");
}

var count = 5
while count > 0 {
    count--
}

switch grocery {
    
case is GroceryType:
    println("It's grocery!")

case (let name, 0.0...100.0, _):
    println("\(name)'s price is between $0 and $100!")

case ("Beans", _, _):
    println("It's beans!")


default:
    println("It's something else!")

}

arrayOfInts



typealias NumberModifier = Int -> Int

var addTwo : NumberModifier

func addTwoToNumber(number : Int) -> Int {
    return number+2
}

addTwo = addTwoToNumber

arrayOfInts.map(addTwo)

func doSomething(withNumber number : Int, withMultiplier multiplier : Int) -> Int {
    return 42 + number * multiplier
}

var funcVar = doSomething

funcVar(withNumber: 2, withMultiplier: 4)

func createAdder(numberToAdd : Int) -> Int -> Int {
    
    func theAdder(aNumber : Int) -> Int {
        return aNumber + numberToAdd
    }
    
    return theAdder
    
}

addTwo = createAdder(2)

addTwo(95)

addTwo = { (number) in
    number + 2
}

addTwo(13)

arrayOfInts

arrayOfInts.sorted(  ) {$0 < $1}

var myPoint : CGPoint = CGPoint(x: 2, y: 3)

extension CGPoint {
    
    func length() -> CGFloat {
        
        return sqrt(self.x * self.x + self.y * self.y)
        
    }
    
}

myPoint.length()

var myOtherPoint = CGPoint(x: 1, y: 1)



func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x,
                   y: left.y + right.y)
}

myPoint + myOtherPoint

extension Int {
    func double() -> Int {
        return self * 2
    }
    
}


2.double()

// public
// protected
// private

//

// public
// internal
// private

protocol LoadingComplete {
    func isLoading() -> Bool
}

class WebBrowser : LoadingComplete {
    
    func isLoading() -> Bool {
        return false
    }
    
    func loadPage(page : String) {
        
    }
    
    private func renderPage() {
        
    }
    
    var currentWebsite : String = "about:blank"
    
    var windowTitle : String {
        willSet {
            println("Window title is about to change from \(windowTitle) to \(newValue)")
        }
        
        didSet {
            println("Window title changed from \(oldValue) to \(windowTitle)")
        }
    }
    
    var lastResponseCode : Int?
    
    var numberOfAdsOnCurrentPage : Int {
        // walk the DOM and count ad elements
        return 24512341
    }
    
    var numberOfOpenTabs : Int {
        get {
            return /*whatever*/ 3
        }
        set {
            /* close or open tabs and then continue */
        }
    }
    
    init (browserName : String) {
        windowTitle = "Welcome to \(browserName)"
    }
    
    convenience init (browserName: String, tabs : [String]) {
        self.init(browserName: browserName)
        
        // do something with tabs
    }
    
    deinit {
        // goodbye!
    }
    
}

//let safari = WebBrowser(browserName: <#String#>, tabs: <#[String]#>)

class PrivateModeBrowser : WebBrowser {
    
    var privacyLevel : Float
    
    override init(browserName: String) {
        
        self.privacyLevel = 1.0
        
        super.init(browserName: browserName)
        
        
    }
    
    
}

var opera = WebBrowser(browserName: "Opera")

opera.windowTitle
opera.currentWebsite
opera.lastResponseCode
opera.numberOfAdsOnCurrentPage


var aLoader : LoadingComplete = opera
aLoader.isLoading()

var anotherBrowser = opera

anotherBrowser.windowTitle = "Firefox"

opera.windowTitle

struct Square {
    var size : Float
    var color : UIColor
    
    mutating func changeColor() {
        
        let colors = [
            UIColor.redColor(),
            UIColor.greenColor()
        ]
        
        let color = colors[Int(rand()) % colors.count]
        
        self.color = color
    }
    
    var area : Float {
        get {
            return size * size
        }
        set {
            size = sqrt(newValue)
        }
    }
}

var mySquare = Square(size: 2.0, color: UIColor.yellowColor())

mySquare.changeColor()

mySquare.area = 9
mySquare.size

var myOtherSquare = mySquare

myOtherSquare.size = 6.0

mySquare.size

extension CGPoint : Hashable {
    
    public var hashValue : Int {
        return Int(self.x) ^ 32 + Int(self.y)
    }
    
}

var pointGrid = [
    
    CGPoint(x: 0, y: 0): "Spaceship",
    CGPoint(x: 0, y: 3): "Planet"
    
]

class Tree<T : Equatable> {
    
    var data : T
    
    var children : [Tree<T>] = []
    
    init (data: T) {
        self.data = data
        
    }
    
    func addChild(data: T) -> Tree<T> {
        let newNode = Tree(data: data)
        children.append(newNode)
        return newNode
    }
    
    func containsData(dataToFind: T) -> Bool {
        if (self.data == dataToFind) {
            return true
        }
        
        
        for childNode in self.children {
            if childNode.containsData(dataToFind) {
                return true
            }
        }
        
        return false
    }
    
}

let numberTree = Tree(data: 5)
numberTree.addChild(2)
numberTree.addChild(7).addChild(2)

numberTree.containsData(2)

let stringTree = Tree(data: "hello")


enum CompassDirection : Int {
    
    case North
    case South
    case East
    case West
    
}

enum HTTPVerb : String {
    
    case GET = "GET"
    case POST = "POST"
    
    
}

enum Planet : Int {
    case Mercury = 1
    case Venus
    case Earth
    case Mars
    case Jupiter
    case Saturn
    case Uranus
    case Neptune
}

var myPlanet = Planet(rawValue: 5)

var myHTTPRequest = HTTPVerb.GET
myHTTPRequest.rawValue

var theWall = CompassDirection.North
theWall = .South
theWall.rawValue

switch theWall {
case .North:
    println("The wall is to the north")

default:
    ()
}

enum Beverage {
    case Tea(milk: Bool, sugars:Int)
    case Coffee(milk: Bool, sugars:Int)
    case Soda(name:String)
}

var myDrink = Beverage.Coffee(milk: true, sugars: 2)

/*switch myDrink {
    
case .Coffee(true, let sugars):
    println("It's coffee, but with milk and \(sugars) sugars")

case .Coffee(_, 2):
    println("It's coffee, but with 2 sugars")
    
case .Coffee:
    println("It's coffee")

default:
    ()

}*/

infix operator ** { associativity left precedence 160 }

func ** (left: Double, right: Double) -> Double {
    return pow(left, right)
}

2.0 ** 3.4 ** 2.0

prefix operator +++ {}
prefix func +++(inout int:Int) -> Int {
    int = 5
    return 2
}


var a = 1
var b = +++a + 1
a
b

var anArray    = [1,2,3]
var aSet : Set = [1,2,3]

struct Regex {
    
    let pattern : String
    let options : NSRegularExpressionOptions
    
    private var matcher:NSRegularExpression? {
        return NSRegularExpression(pattern: self.pattern, options: self.options, error: nil)
    }
    
    init (pattern : String, options : NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive) {
        
        self.pattern = pattern
        self.options = options
        
    }
    
    func match(string: String, options:NSMatchingOptions = nil) -> Bool {
        return self.matcher?.numberOfMatchesInString(string,
            options: options,
            range: NSMakeRange(0, string.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))) != 0
    }
    
}

extension Regex : StringLiteralConvertible {
    
    typealias UnicodeScalarLiteralType = StringLiteralType
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    
    init(stringLiteral value: StringLiteralType) {
        self.pattern = value
        self.options = .CaseInsensitive
    }
    
    init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.pattern = value
        self.options = .CaseInsensitive
    }
    
    init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.pattern = value
        self.options = .CaseInsensitive
    }
    
}

let myRegex : Regex = "foo"
myRegex.match("foo bar bas")

var myByte : UInt8
myByte = 255
myByte = myByte &+ 1

var myUInt : UInt64 = 0
myUInt = myUInt &- 1

let debugMode = true

/*func myAssert( predicate : @autoclosure () -> Bool) {
    
    if (debugMode == true) {
        if predicate() == false {
            abort()
        }
    }
}

myAssert(1==1) */

let fileManager = NSFileManager.defaultManager()

var documentsDirectory =
    fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory,
    inDomains: NSSearchPathDomainMask.UserDomainMask).first as? NSURL

println(documentsDirectory!)

let fileContents = "I am the very model of a modern major general"

if let destinationURL = documentsDirectory?.URLByAppendingPathComponent("penzance.txt") {
    fileContents.writeToURL(destinationURL, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
}


var str = "Hello, playground"

str.componentsSeparatedByString(" ")

str.uppercaseString
str.lowercaseString

str.hasPrefix("Hello")
str.hasSuffix("playground")

str.startIndex..<str.endIndex

str.rangeOfString("playground")
str.rangeOfString("pLaYgRoUnD", options: .CaseInsensitiveSearch)

str = "/Users/jon"

str.pathExtension
str.pathComponents

str.stringByAppendingPathComponent("Foo.txt")

str = "This is a number: \(4+4)"

class Car : Printable, DebugPrintable {
    var numberOfWheels = 4
    
    var description : String {
        return "A car with \(numberOfWheels) wheels"
    }
    
    var debugDescription : String {
        return "A more detailed description"
    }
    
    
}

Car().description

fileManager.description

let numberFormatter = NSNumberFormatter()

numberFormatter.numberStyle = .CurrencyStyle
numberFormatter.stringFromNumber(23.42)

numberFormatter.roundingIncrement = 0.5
numberFormatter.stringFromNumber(23.42)

numberFormatter.roundingIncrement = 0.0

numberFormatter.numberStyle = .DecimalStyle
numberFormatter.stringFromNumber(3678178923)


let massFormatter = NSMassFormatter()

massFormatter.stringFromKilograms(0.5)

let lengthFormatter = NSLengthFormatter()

lengthFormatter.stringFromMeters(100)

let dataFormatter = NSByteCountFormatter()

dataFormatter.countStyle = NSByteCountFormatterCountStyle.Binary
dataFormatter.stringFromByteCount(200000)
dataFormatter.stringFromByteCount(0)

let dateFormatter = NSDateFormatter()

dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle

dateFormatter.stringFromDate(NSDate())


dateFormatter.dateFormat = "yyyy.MM.dd"

let march21st = dateFormatter.dateFromString("2015.03.21")

let oneMonth = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitMonth, value: 1, toDate: march21st!, options: NSCalendarOptions.allZeros)

let components = NSCalendar.currentCalendar().components(.CalendarUnitYear | .CalendarUnitMonth, fromDate: march21st!)

components.year



let source = [1, 2, 4, 8]

let mapped
    = source.map({ $0 * 2 })

let reduced
    = source.reduce(0, combine: +)

let filtered
    = source.filter({ $0 % 4 == 0 })

let sorted
    = source.sorted({ $0 > $1 })








