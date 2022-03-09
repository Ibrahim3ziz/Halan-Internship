import UIKit
import XCTest

// Conceptual Example

class Singleton {
    static var shared: Singleton = {
        let instance = Singleton()
        
        return instance
    }()
    
    // private initializing to prevent direct construction calls
    private init () {}
    
    func someBusinessLogic() -> String {
        return "Result of some business logic call."
    }
}

// MARK: -

// Not cloneable
extension Singleton: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}


class Client {
     static func someClientCode() {
        let instance1 = Singleton.shared
        let instance2 = Singleton.shared
        
        if (instance1 === instance2) {
            print("Singleton works, The same object")
        } else {
            print("Singleton doesn't work, there are two diff. objects")
        }
    }
}

//let clientOne = Client.someClientCode()
//print(clientOne)


class SingletonConceptual: XCTestCase {
    func testSingleton() {
        Client.someClientCode()
    }
}



