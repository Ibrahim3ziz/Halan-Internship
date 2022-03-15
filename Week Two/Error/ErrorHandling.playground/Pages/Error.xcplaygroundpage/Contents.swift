//: [Previous](@previous)

import UIKit

enum ParseLocationError: Error {
    case inavalidData, locationDoesNotExist, middleOfTheOcean
}

struct MultipleParseLocationErrors: Error {
    let parsingError: [ParseLocationError]
    let isShownToUser: Bool
}

struct Location {
    let longitude: Double
    let latitude: Double
}


/// Description
/// - Parameters:
///   - latitude:  A string containing a latitude value
///   - longitude: A string containing a longitude value
/// - Throws: Will throw a ParseLocationError.invalidData if lat and long can't be converted to Double.
/// - Returns: A location of Double

    func parseLocation(_ latitude: String, _ longitude: String) throws -> Location {
        guard let latitude = Double(latitude),
              let longitude = Double(longitude)
        
        else {
            throw ParseLocationError.inavalidData
        }
        
        return Location(longitude: longitude, latitude: latitude)
    }

    do {
        try parseLocation("324", "23154.43")
    }
    catch {
        print(error)
    }
