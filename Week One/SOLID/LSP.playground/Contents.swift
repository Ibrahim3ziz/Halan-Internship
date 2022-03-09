// https://www.marcosantadev.com/solid-principles-applied-swift/

import UIKit

// MARK: - Preconditions change

// Functions that use references or pointers to Base class must be able to use Objects of Derived classes without knowing it.

// Here we break the LSP.

class Handler {
    func save(string: String) {
        // Save the String in the cloud
    }
}

class FilteredHandler: Handler {
    
    override func save(string: String) {
        guard string.count > 5 else { return }
        super.save(string: string)
    }
}

// MARK: - Solution: LSP Application
// We will ger rid of the subclass FilteredHandler and inject the minimum lenght of Chatachters to filer


class HandlerLSP {
    func save(string: String, minChars: Int = 0) {
        guard string.count > minChars else { return }
        // Save the string to Cloud
    }
}




// MARK: - PostConditions change


class Rectangle {
    var length: Float = 0
    var width: Float = 0
    
    var area: Float {
        return length * width
    }
    
}

class Square: Rectangle {
    
    override var width: Float {
        didSet {
            length = width
        }
    }
}



class Client {
    func printArea(of rectangle: Rectangle) {
        rectangle.length = 5
        rectangle.width = 2
        print(rectangle.area)
    }
}


let rect = Rectangle()
print(Client().printArea(of: rect))

let square = Square()
print(Client().printArea(of: square))



// MARK: - Solution: LSP Application

protocol Shape {
    var area: Float {get}
}


class RectangleLSP: Shape {
    private let length: Float
    private let width: Float
    
    init(width: Float, length: Float) {
          self.width = width
          self.length = length
      }
    
    var area: Float {
        length * width
    }
    
}


class SquareLSP: Shape {
    private let side: Float
    
    init(side: Float) {
        self.side = side
    }

    var area: Float {
        pow(side, 2)
    }

}


class ClientTwo {
    func printArea(of shape: Shape) {
        print(shape.area)
    }
}

let rectLSP = RectangleLSP(width: 2, length: 5)
print(ClientTwo().printArea(of: rectLSP))

let squareLSP = SquareLSP(side: 4)
print(ClientTwo().printArea(of: squareLSP))
