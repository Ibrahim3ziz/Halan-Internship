// https://www.marcosantadev.com/solid-principles-applied-swift/

import UIKit

// States that high level modules shouldn't depend on lower level modules, Both sould depend on abstracion layer
// Abstraction layer shouldn't depend on details, Details should depend on abstraction.
// DECOUPLING DEPENDENCIES


// Higher Level Module which can not be used in other projects as it is tightly coupled with FileManger()

class Handler {
    let fm = FileManger()
    
    func handle(string: String) {
        fm.save(string: string)
    }
}


// Lower Level Module which we can use in other project.
class FileManger {
    func save(string: String) {
        // Open a file
        // Save the string in this file
        // Close the file
    }
}



// Abstraction layer
protocol Storage {
    func save(string: String)
}


class HandlerDIP {
    
    func save(string: String) {
        
    }
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func handle(string: String) {
        storage.save(string: string)
    }
    
}


