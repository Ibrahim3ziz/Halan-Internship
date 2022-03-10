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
    

    
enum ListError: Error {
    case invalidData
}


struct ToDoList {
    private var values: [String]
    
    mutating func append(strings: [String]) throws {
        var trimmedStrings = [String]()
        for string in strings {
            let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if trimmedString.isEmpty {
                throw ListError.invalidData
            } else {
                trimmedStrings.append(trimmedString)
            }
        }
        values.append(contentsOf: trimmedStrings)
    }
}

func writeToFiles(data: [URL: String]) throws {
    var storedURL = [URL]()
    
    defer {
        if storedURL.count != data.count {
            for url in storedURL {
                try! FileManager.default.removeItem(at: url)
            }
        }
    }
    
    for (url, contents) in data {
        try contents.write(to: url, atomically: true, encoding: String.Encoding.utf8)
        storedURL.append(url)
    }
    
}
