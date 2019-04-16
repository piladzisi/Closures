func printString(_ string: String) {
    print("Printing the string passed in as an argument \(string)")
}

printString("Hi, my name is Robot")

let stringPrinterFunction = printString
stringPrinterFunction("Hi, again")

func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let addTwoNumbers = sum

addTwoNumbers(2,5)

//Functions as Parameters
func displayString(usingFunction function: (String) -> Void) {
    function("I'm a function inside a function")
}
displayString(usingFunction: printString)

//challenge
func addTwo(to: Int) -> Int {
    return to + 2
}
addTwo(to: 5)
let addition = addTwo
let result = addition(9)


extension Int {
    func applyOperation (_ operation: (Int) -> Int) -> Int {
        return operation(self)
    }
}

func double(_ value: Int) -> Int {
    return value * 2
}
10.applyOperation(double)

func closestMultipleOfSix(_ value: Int) -> Int {
    for x in 1...100 {
        let multiple = x * 6
        
        if multiple - value < 6 && multiple > value {
            return multiple
        } else if multiple == value {
            return value
        }
    }
    return 0
}

32.applyOperation(closestMultipleOfSix)
12.applyOperation(closestMultipleOfSix)
200.applyOperation(closestMultipleOfSix)

// capturing variables
func gameCounter() -> ((Int) -> Void ){
    
    var localCounter = 0
    
    func increment(_ i: Int) {
        localCounter += i
        print("Integer passed in: \(i). Local counter value: \(localCounter)")
    }
    return increment
}
let counter = gameCounter()
counter(10)
counter(20)

let anotherCounter = gameCounter()
anotherCounter(1)
counter(5)


//MARK: remove vowels func
extension String{
    
    func transform(_ argument : (String) -> String) -> String {
        return  argument(self)
    }
}

func removeVowels(from value: String) -> String {
    var output = ""
    
    for char in value{
        if !(char == "a" || char == "A" || char == "e" || char == "e"
            || char == "i" || char == "I" || char == "o" || char == "O"
            || char == "u" || char == "U") {
            output.append(char)
        }
    }
    return output
}

let resultVar = "Hello, World!".transform(removeVowels)


//MARK: Closure expressions
func doubleMe(_ value: Int) -> Int {
    return value * 2
}

let doubleFunc = doubleMe
doubleFunc(2)

let numbers = [1,2,3,4,5]

let doubledNumbers = numbers.map(doubleFunc)

//MARK: Closure Expression Syntax

// Rule #1: Define the closure inline

let tripledNumbers = numbers.map({(value: Int) -> Int in
    return value * 3
})

//Rule #2: Inferring Type from Context

numbers.map({ value in return value * 3 })

//Rule #3: Implicit Returns from Single-Expression Closures

numbers.map({ value in value * 3 })

//Rule #4: Shorthand Argument Names

numbers.map({ $0 * 3 })

//Rule #5: Trailing Closures

numbers.map() { $0 * 3 }

numbers.map() { number -> Int in
    if number % 2 == 0 {
        return number/2
    }
    return number/3
}
//Rule #6: Ignoring Parenthesis
numbers.map { $0 * 3 }
//MARK: Standard Library Functions
//imperative aproach step by step mutable result
let values = [1,2,3,4,5]
var newArray = Array<Int>()
    for number in values {
        newArray.append(number * 2)
}
//declarative aproach immutable result Yeay!
let doubledNum = values.map { $0 * 2 }

//Map
extension Array {
    func customMap<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}

let integerValues = ["1", "2", "3", "4", "5"].customMap { Int($0) }

import Foundation

struct Formatter {
    static let formatter = DateFormatter()
    
    static func date(from string: String) -> Date? {
        formatter.dateFormat = "d MMM yyy"
        return formatter.date(from: string)
    }
}

let dateStrings = ["20 Oct 1978", "11 Jan 1947", "28 March 2012"]

let dates = dateStrings.customMap { Formatter.date(from: $0)}
print(dates)

let numbersTask = [1,2,3,4,5]
let numberStrings = numbersTask.map { String($0) }
// Flat Map
struct Post {
    var content: String
    var tags: [String]
}
let blog = [
    Post(content: "Hello, world", tags: ["first", "programming"]),
    Post(content: "Another short post", tags: ["general", "short"])
]

let tags = blog.flatMap { $0.tags }
print(tags)
extension Array {
    func customFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
    var result = [T] ()
    
    for x in self{
        result.append(contentsOf: transform(x))
    }
    return result
    }
}

// Example 2

import UIKit

struct Account {
    let username: String
    let billingAddress: String?
}


let allUsers = [
    Account(username: "pasanpr", billingAddress: nil),
    Account(username: "benjakuben", billingAddress: "1234 Imaginary Street"),
    Account(username: "instantNadel", billingAddress: "5678 Doesn't Live Here Dr."),
    Account(username: "sketchings", billingAddress: nil),
    Account(username: "paradoxed", billingAddress: "1122 Nope Lane")
]

let validAddressess = allUsers.compactMap { $0.billingAddress }
print(validAddressess)
validAddressess.count

//Filter

let evenNumbers = (0...50).filter { $0 % 2 == 0}
print(evenNumbers)


extension Array {
    func customFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        
        for x in self where isIncluded(x){
            result.append(x)
        }
        return result
    }
}

let somePUsers = allUsers.customFilter { $0.username.first == "p" }
print(somePUsers)
