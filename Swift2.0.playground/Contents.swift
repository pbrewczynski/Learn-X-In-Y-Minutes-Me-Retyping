// import a module
import UIKit

//
// MARK: Basics
// 

// Xcode supports landmarks to annotate your code and list the in the jump bar
// MARK: Section mark
// MARK: - Section mark with a separator line
// TODO: Do something soon
// FIXME: Fix this code

// In Swift 2, println and print were combined into one print method. Print automatically appends a new line
print("Hello, world") // println is now print
print("Hello, world", terminator: "") // printing without appending a newline

// variables (var) value can change after being set
// constans (let) value can NOT be changed after being set

var myVariable = 42
let øπΩ = "value" // unicode variable names
let n = 3.1415926
let convenience = "keyword" // contextual variable name
let weak = "keyword"; let override = "another keyword" // statements can be separated by a semi-colon
let `class` = "keyword" // backticks allow keywords to be used as variable names
let explicitDouble: Double = 70
let intValue = 0007 // 7
let larteIntValue = 77_000 // 77000
let label = "some text " + String(myVariable) // String construction
let piText = "Pi = \(n), Pi 2 = \(n * 2)"

#if false
    print("Not printed")
    let buildValue = 3
#else
    let buildValue = 7
#endif
print("Build value: \(buildValue)") //  Build value 7

/*
Optionals are a Swift language feature that either contains a value,
or contains nil (no value) to indicate that a value is missing.
A question mark (?) after the type marks the value as optional.

Because Swift requires every property to have a value, even nil must be
explicitly stored as an Optional value.

Optional<T> is an enum
*/

var someOptionalString: String? = "optional" // Can be nil
// same as above, but ? is a postfix operator (syntax candy)
var someOptionalString2: Optional<String> = "optional"

if someOptionalString != nil {
    // I am not nil
    if someOptionalString!.hasPrefix("opt") {
        print("has the prefix")
    }
    
    let empty = someOptionalString?.isEmpty
}
someOptionalString = nil

/*
Trying to use ! to access non-existent optional value triggers a runtime error..
Always make sure that an optional contains a non-nil value before using ! to force-unwrap its value
*/

// implicitly unwrapped optional
var unwrappedString: String! = "Value is expected"
// same as above, but ! is postfix operator (more syntax candy)
var unwrappedString2: ImplicitlyUnwrappedOptional<String> = "Value is expected"

if let someOptionalStringConstant = someOptionalString {
    // has `Some` value, non-nil
    if !someOptionalStringConstant.hasPrefix("ok") {
        // does not have the prefix
    }
}

// Swift has support for stroing a value of any type
// AnyObject == id
// Unlike Objective-C `id`, AnyObject works with any value (Class, Int, Struct, etc.)

var anyObjectVar: AnyObject = 7
anyObjectVar = "Changed value to a string, but good practice, but possible"

/* 
    Comment here
    
    /* 
        Nested commments are also supported
    */
*/

//
// MARK: Collections
//

/*
Array and Dictionary types are structs. So `let` and `var` also indicate
that they are mutable (var) or immutable (let) when declaring these types
*/

// Array
var shoppingList = ["catfish", "water", "lemons", "apples"]
shoppingList[1] = "bottle of water"
let emptyArray = [String]() // let == immutable
let emptyArray2 = Array<String>() // Same as above
var emptyMutableArray = [String]() // var == mutable
var explicitEmptyMutableStringArray: [String] = []

// Dictionary
var occupations = [
    "Malcolm": "Captain",
    "kayleee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"
let emptyDictionary = [String: Float]() // let == immutable
let emptyDictionary2 = Dictionary<String, Float>() // same as above
var emptyMutableDictionary = [String: Float]() // var == mutable
var explicitlyEmptyMutableDictionary: [String: Float] = [:] // same as above


// 
// MARK: Control Flow
//

// Condition statemets supporte "where" clauses which can be used
// to help provide conditions on optional values.
// Both the assignment and the "where" clause must pass
let someNumber: Int? = nil
var k: Int = 4
if let num = someNumber where num > 3 {
    print("num is greater than 3")
}

// for loop (array)
let myArray = [1, 1, 2, 3, 5]
for value in myArray {
    if value == 1 {
        print("One!")
    } else {
        print("Not one!")
    }
}

// for loop (dictionary)
var dict = ["one" : 1, "two": 2]
for (key, value) in dict {
    print("\(key): \(value)")
}

// for loop (range)
for i in -1...shoppingList.count {
    print(i)
}
shoppingList[1...2] = ["steak", "peacons"]
// use ..< to exclude the last number

// while loop
var i = 1
while i < 1000 {
    i *= 2
}

// repeat-while loop
repeat {
    print("hello")
} while 1 == 2

// Switch
// Very powerful, think `if` statements with syntax candy
// They support String, object instances, and primitives (Int, Double, etc)
let vegetable = "red pepper"
switch vegetable {
case "celery":
        let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea sandwich"
case let localScopeValue where localScopeValue.hasSuffix("pepper"):
        let vegatableComment = "Is it a spicy \(localScopeValue)"
default: // required (in order to cover all possible input)
        let vegetableComment = "Everything tastes good in soup."
}

// 
// MARK: Functions
//

// Functions are a first-class type, meaning they can be nested
// in functions and can be passed around

// Function with Swift header docs (format as markdown)

/**
A greet operation 

- A bullet in docs
- Another bullet in the docs

- Parameter name: A name
- Parameter day: A day
- Returns: A string containing the name and day value
*/
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}
greet("Bob", day: "Tuesday")

// similar to above except for the function parameter behaviours
func greet2(requiredName requiredName: String, externalParamName localParamName: String) -> String {
    return "Hello \(requiredName), the day is \(localParamName)"
}
greet2(requiredName: "John", externalParamName: "Sunday")

// Function that returns multiple items in a tuple
func getGasPrices() -> (Double, Double, Double) {
    return (3.5, 3.69, 3.79)
}
let pricesTuple = getGasPrices()
let price = pricesTuple.2 // 3.79
//  Ignore Tuple (or other) values by using _ (underscore)
let (_, price1, _) = pricesTuple
print(price1 == pricesTuple.1)
print("Gas price: \(price)")

// Labeled/named tuple params
func getGasPrices2() -> (lowestPrice: Double, highestPrice: Double, midPrice: Double) {
    return (1.77, 37.70, 7.37)
}

let pricesTuple2 = getGasPrices2()
let price2 = pricesTuple2.lowestPrice
let (_, price3, _) = pricesTuple
print(pricesTuple2.highestPrice == pricesTuple2.1) // true
print("Highest gas price: \(pricesTuple2.highestPrice)")

// guard statements
func testGuard() {
    // guard provide early exits or breaks, placing the error handler code near conditions
    // it places variables it declares in the same scope as guard statement
    
    guard let aNumber = Optional<Int>(7) else {
        print("sth")
        return
    }
    
    print("number is \(aNumber)")
}
testGuard()

// Variadic Args
func setup(numbers: Int...) {
    // its an array
    let _ = numbers[0]
    let _ = numbers.count
    
    print(numbers.count)
    
}
setup(43,43,2)

// Passing and returning functions
func makeIncrement() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrement()
print(increment(7))

// pass by ref
// TODO to read
func swapTwoInts(inout a: Int, inout b: Int) {
    let tempA = a;
    a = b
    b = tempA
}
var someIntA = 7
var someIntB = 3

swapTwoInts(&someIntA, b: &someIntB)
print(someIntB)

//
// MARK: Closures
//
var numbers = [1, 2, 6]

// Functions are special case ({})

// Closure example
// `->` separates the arguments and return type
// `in` separates the closure header from the closure body
let tripled = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

print(numbers)
// When the type is known, like above we can do this
let tripled2 = numbers = numbers.map({ number in 3 * number})

print(tripled)
print(tripled2)
// Or even this
numbers = numbers.map({$0 * 3})
print(numbers)
let a:()
print(a)

// Trailing closure
numbers = numbers.sort { $0 > $1}

print(numbers)

//
// MARK: Structures
//

// Strucures and classes have very similar capabilities
struct NamesTable {
    let names: [String]
    
    // Custom subscript
    subscript(index: Int) -> String {
        return names[index]
    }
}

// Structures have an auto-generated (implicit) designated initializer
let namesTable = NamesTable(names: ["Me", "Then"])
let name = namesTable[1]
print("Name is \(name)")

//
// MARK: Error Handling
//

// The `ErrorType` protocol is used when throwing error to catch
enum MyError: ErrorType {
    case BadValue(msg: String)
    case ReallyBadValue(msg: String)
}

// functions marked with `throws` must be called using `try`
func fakeFetch(value: Int) throws -> String {
    guard 7 == value else {
        throw MyError.ReallyBadValue(msg: "Some really bad value")
    }
    
    return "test"
}

func testTryStuff() {
    // assumes there will be no error thrown, otherwise a runtime exception is raised
    let _ = try! fakeFetch(7)
    
    // if an error is thrown, then it proceeds, but if the value is nil
    // it also wraps every return value in an optional even if its already optional
    let trtyf = try? fakeFetch(7)
    print(trtyf)
    
    
    do {
        try fakeFetch(1)
    } catch MyError.BadValue(let msg){
        print("Error message: \(msg)")
    } catch MyError.ReallyBadValue(let go){
        print("Error message \(go)" )
    } catch {
        
    }
}
testTryStuff()


//
// MARK: Classes
// 

// Classes, structures and its members have three levels of control
// They are: internal (default), public, private

public class Shape {
    public func getArea() -> Int {
        return 0
    }
}

// All methods and properties of a class are public
// If you just need to store data in a
// structured object, you should use a `struct`

internal class Rect: Shape {
    var sideLength: Int = 1
    
    // Custom getter and setter property
    private var perimeter: Int {
        get {
            return 4 * sideLength
        }
        set {
            // `newValue` is an implicit variable available to setters
            sideLength = newValue / 4
        }
    }
    
    
    // Computed properties mus be declared as `var`, you know, cause' they can change
    var smallestSideLength: Int {
        return self.sideLength - 1
    }
    
    // Lazy load a property
    // subShape remains nil (uninitialized) until getter called
    lazy var subShape = Rect(sideLength: 4)
    
    // If you don't need a custom getter and setter
    // but still want to run code before and after getting or setting
    // a property, you cans use `willSet` and `didSet`
    var identifier: String = "defaultID" {
        // the `willset` arg will be the variable name for the new value
        willSet {
            print(newValue)
        }
    }
    
    init(sideLength: Int) {
        self.sideLength = sideLength
        // alwayws super.init last when init custom properties
        super.init()
    }
    
    
    func shrink() {
        if sideLength > 0 {
            --sideLength
        }
    }
    
    override func getArea() -> Int {
        return sideLength * sideLength
    }
    
}

// A simple class `Square` extends `Rect`
class Square: Rect {
    convenience init() {
        self.init(sideLength: 5)
    }
}

var mySquare = Square()
print(mySquare.getArea()) // 25
mySquare.shrink()
print(mySquare.sideLength) // 4

// cast insatance
let aShape = mySquare as Shape

// compare instance, not the same as == which compares objects (equal to)
if mySquare === mySquare {
    print("Yep, it's mySquare")
}

// Optional init
class Circle: Shape {
    var radius: Int
    override func getArea() -> Int {
        return 3 * radius * radius
    }
    
    // Place a question mark postfix after `init` is an optional init
    // which can return nil
    
    init?(radius: Int) {
        self.radius = radius
        super.init()
        
        if radius <= 0 {
            return nil
        }
    }
}


var myCircle = Circle(radius: 1)
print(myCircle?.getArea()) // Optional(3)
print(myCircle!.getArea()) // 3
var myEmptyCircle = Circle(radius: -1)
print(myEmptyCircle?.getArea()) // nil
if let circle = myEmptyCircle {
    // will not execute since myEmptyCircle is nil
    print("circle is not nil")
}

//
// MARK: Enums
//

// Enums can optionally be of a specyfic type or on their own













