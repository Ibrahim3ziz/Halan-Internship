//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit

enum LoadError: Error {
    case couldNotLoadFile
}

func loadFile(name: String) -> Data? {
    let url = playgroundSharedDataDirectory.appendingPathComponent(name)
    
    do {
        return try Data(contentsOf: url)
    }
    catch _ as NSError {
        print("Can't load file name \(name)")
        return nil
    }
    catch LoadError.couldNotLoadFile {
        print("\(LoadError.couldNotLoadFile.localizedDescription)")
        return nil
    }
    catch {
        print("There is some error.")
        return nil
    }
}

//: [Next](@next)
