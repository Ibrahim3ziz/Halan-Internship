import Foundation
import UIKit

protocol Storable { }

extension Object: Storable { }
extension NSManagedObject: Storable { }

protocol StorageManager {
    func save(object: Storable)
}


class User: Storable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
 
class UserService: StorageManager {
    func save(object: Storable) {
        // Saves user to database
    }
}
