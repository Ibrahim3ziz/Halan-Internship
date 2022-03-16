//: [Previous](@previous)

import Foundation
import UIKit
import XCTest

protocol Creator {
    
    func factoryMethod() -> Product
    
    func someOperations() -> String
}


extension Creator {
    
    func someOperations() -> String {
        let product = factoryMethod()
        return "Creator: The same creator's code has just worked with" + product.operation()
    }
}

protocol Product {
    
    func operation() -> String
}


class ConcreteCreator1: Creator {
    
    func factoryMethod() -> Product {
        return ConcreteProduct1()
    }
      
}

class ConcreteCreator2: Creator {
    
    func factoryMethod() -> Product {
        return ConcreteProduct2()
    }
}


class ConcreteProduct1: Product {
    
    func operation() -> String {
        return "{Result of the ConcreteProduct1}"
    }
    
}


class ConcreteProduct2: Product {
    
    func operation() -> String {
        return "{Result of the ConcreteProduct2}"
    }
    
}

//: [Next](@next)
