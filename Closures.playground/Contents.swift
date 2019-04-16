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

let numbers = [1,2,3,4]

let doubledNumbers = numbers.map(doubleFunc)
