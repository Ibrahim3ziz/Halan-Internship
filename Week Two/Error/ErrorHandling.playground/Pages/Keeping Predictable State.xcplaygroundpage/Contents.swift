//: [Previous](@previous)

import Foundation
import UIKit


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
