// https://www.marcosantadev.com/solid-principles-applied-swift/

import UIKit
// states that entities(module, class, func, ...) should be closed for modification open for extending

class Logger {
    func printData() {
        let cars = [Car(name: "Batmobile", color: "Green"),
                    Car(name: "SuperCar", color: "Black"),
                    Car(name: "FamilyCar", color: "White")]
        
        for car in cars {
            print(car.printDetails())
        }
    }
    
}


class Car {
    let name: String
    let color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    func printDetails() -> String {
        return "I am \(name), and my color is \(color)"
    }
}

// Now if we wanted to add a new class say Bicycle, we need to reimplement the func printData(), breaking the OCP.
// So, we can use a protocol(will be implemented by classes that will be used in logger
// Now there is a new abstract layer between printData() and the class to log, allowing the print of other classes like Bicycle and without changing the printData() implementation.


protocol Printable {
    // Mehods must be implemented in types conform to this protocol.
    func printData() -> String
}


class LoggerPrintable {
    func printData() {
        // Using protocol as a type.
        let vehicles: [Printable] = [CarPrintable(name: "Batmobile", color: "Green"),
                                     CarPrintable(name: "SuperCar", color: "Black"),
                                     CarPrintable(name: "FamilyCar", color: "White"),
                                     BicyclePrintable(type: "Ttrinx"),
                                     BicyclePrintable(type: "Omega")]
        
        for vehicle in vehicles {
            print(vehicle.printData())
        }
    }
    
}

class CarPrintable: Printable {
    func printData() -> String {
        return "I am \(name), and my color is \(color)"
    }
    
    let name: String
    let color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
}


class BicyclePrintable: Printable {
    func printData() -> String {
        return "I am \(type)"
    }
    
    let type: String

    init(type: String) {
        self.type = type
    }
}


