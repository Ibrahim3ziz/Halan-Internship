//: [Previous](@previous)

import Foundation

// Validation a phone number

enum ValidationError: Error {
    case noEmptyValueAllowed
    case invalidPhoneNumber
}

func validatePhoneNumber(_ text: String) throws {
    guard !text.isEmpty else {
        throw ValidationError.noEmptyValueAllowed
    }
    
    let pattern = "^(\\([0-9]{3}\\) |[0-9]{3}-[0-9]{3}-[0-9]{4}$)"
    
    if text.range(of: pattern, options: .regularExpression, range: nil, locale: nil) == nil {
        throw ValidationError.invalidPhoneNumber
    }
}

//do {
//    try validatePhoneNumber("(123) 123-1234")
//    print("Phone Number is valid.")
//}
//catch {
//    print(error)
//}


struct PhoneNumber {
    let contents: String
    
    // Failable initializer.
    init(_ text: String) throws {
        guard !text.isEmpty else {
            throw ValidationError.noEmptyValueAllowed
        }
        
        let pattern = "^(\\([0-9]{3}\\) |[0-9]{3}-[0-9]{3}-[0-9]{4}$)"
        
        if text.range(of: pattern, options: .regularExpression, range: nil, locale: nil) == nil {
            throw ValidationError.invalidPhoneNumber
        }
        // If the number is validate, the value is stored.
        self.contents = text
    }
    
}

do {
    let phoneNumber = try PhoneNumber("(123) 123-1234")
    print(phoneNumber.contents)
}
catch {
    print(error)
}

let phoneNumber = try? PhoneNumber("(123) 123-1234")
let phoneNumber2 = try! PhoneNumber("(123) 123-1234")
// As with force unwrapping, only use try! when you know better than the compiler. Otherwise, you’re playing Russian Roulette.
let phoneNumber3 = try! PhoneNumber("Not a phone number")

print(phoneNumber)
print(phoneNumber2)
print(phoneNumber3)

//: [Next](@next)


