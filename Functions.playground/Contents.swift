import UIKit

// Defining and calling functions

func greet(person: String) -> String {
    let greeting = "Hello" + person + "!"
    return greeting
}

print(greet(person: "Himanshu"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetAgain(person: "Anna"))

//Function Parameters and return values

// Functions without parameters

func sayHelloWorld() -> String {
    return "Hello, world"
}

print(sayHelloWorld())

// Function with multiple parameters

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else{
        return greet(person: person)
    }
}
print(greet(person: "Shivanshu", alreadyGreeted: true))

// Function without return Values

func greet2(person: String) {
    print("Hello, \(person)!")
}

greet2(person: "Aman")

//

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func prinWithOutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "Hello, world")
prinWithOutCounting(string: "Hello, world")

//--------------------------------------------------------------------------------------------------//

// Functions with multiple return values (Tuples)

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// Optional Tuple Return Types

func minMaxOptional(array: [Int]) -> (min: Int, max: Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// Use optional binding to check nil

if let optionalBounds = minMaxOptional(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(optionalBounds.min) and max is \(optionalBounds.max)")
}

//--------------------------------------------------------------------------------------------------//

// Functions with an Implicit Return - If the whole body of the function is a single expression, the function implicitly returns that expression. For example, both functions below have the same behavior:

func greetingImplicit(for person: String) -> String {
    "hello ," + person + "!"
}

print(greetingImplicit(for: "Himanshu"))

func greetingNonImplicit(for person: String) -> String {
    "hello ," + person + "!"
}

prinWithOutCounting(string: greetingNonImplicit(for: "Shivanshu"))

//--------------------------------------------------------------------------------------------------//

//Function Argument Labels and Parameter Names

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}

someFunction(firstParameterName: 1, secondParameterName: 2)

// Specifying Argument Labels

func greetWithArgument(person: String, from homeTown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(homeTown)."
}

print(greetWithArgument(person: "Himanshu", from: "Banglore"))

// Omitting Argument Labels -
// if you don't want parameter

func someFunctionOmit(_ firstParameter: Int, secondParameter: Int) {
    
}

someFunctionOmit(1, secondParameter: 2)

// Default parameter Values

func someFunctionDefault(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    
}

someFunctionDefault(parameterWithoutDefault: 4)
someFunctionDefault(parameterWithoutDefault: 3, parameterWithDefault: 6)

//--------------------------------------------------------------------------------------------------//

// Variadic Parameters - at most one variadic parameter allowed.

func airthmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

airthmeticMean(1, 2, 3, 4, 5)
airthmeticMean(3, 5.5, 8.25, 18.75)

//--------------------------------------------------------------------------------------------------//

// In-Out Parameters

// value in inout parameter should be var
// variadic parameters can't be marked as inout

func swapTwoNumber(_ a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var a1 = 3
var b1 = 107
swapTwoNumber(&a1, b: &b1)
print("a1 is now \(a1), and b1 is now \(b1)")

//--------------------------------------------------------------------------------------------------//

// Function Types

func addTwoPoints(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a*b
}

func printHelloWorld() {
    print("hello, world")
}

// Using function types

var mathFunction: (Int, Int) -> Int = addTwoPoints

print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoPoints

//--------------------------------------------------------------------------------------------------//

// Function Types as Parameter Types - read from documentation

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoPoints, 3, 5)

//--------------------------------------------------------------------------------------------------//

// Function Types as Return Types

func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepsFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepsFunction(backward: currentValue > 0)

print("counting to zero:")
// counting to zero:

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("Zero!")

//--------------------------------------------------------------------------------------------------//

// Nested Functions

func chooseStepsFunctionNested(backward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int { return input + 1 }
    func stepBackward(_ input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

currentValue = -4

let moveNearerToZeroNested = chooseStepsFunctionNested(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZeroNested(currentValue)
}

print("Zero!")
