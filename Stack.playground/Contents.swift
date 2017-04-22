//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


public struct Stack<T> {
    fileprivate var elements = [T]()
    public init(){}
    
    // pop
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    // push
    public mutating func push(element : T){
        self.elements.append(element)
    }
 
    // peek
    public func peek() -> T? {
        return self.elements.last
    }

    // empty 
    public func isEmpaty() -> Bool {
        return self.elements.isEmpty
    }
    
    // count
    public func count() -> Int {
        return self.elements.count
    }
    
}

var stack = Stack<Int>()
stack.push(element: 10)
stack.push(element: 20)
stack.push(element: 30)
stack.push(element: 40)
stack.push(element: 50)

print(stack.peek() ?? 0)

stack.pop()

print(stack.count())


extension Stack : CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description:String {
        return self.elements.description
    }
    
    public var debugDescription:String {

        return self.elements.debugDescription
    }
}

stack.debugDescription
stack.description


//Type Inference of Array Literals


extension Stack : ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: T...) {
        self.init()
        for item in elements {
            self.push(element: item)
        }
    }
    
}

let s = [10,20,30,50]
let a = Stack(arrayLiteral: [10,20,30,40])


public struct MyIterator<T> : IteratorProtocol {
    
    var currentElement: [T]
    
    
    init(elements: [T]) {
        self.currentElement = elements
    }
    
    
    public mutating func next() -> T? {
    
        if ( !self.currentElement.isEmpty ){
            return self.currentElement.popLast()
        }
        return nil
    }
    
}


extension Stack : Sequence {
    
    public func makeIterator() -> MyIterator<T> {
        return MyIterator<T>(elements: self.elements)
    }
    
}


for (i,a) in s.enumerated() {
    print(a)
}

s.forEach { (k) in
    print(k)
}


