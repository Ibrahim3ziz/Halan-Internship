import UIKit

class Player {

    let id: Int
    
    var name: String = ""

    
    func trm(name: String) -> String {
         return name.trimmingCharacters(in: .whitespaces)
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = trm(name: name)
    }
    
    // Officially, the recommended technique is to separate the didSet closure into a function, then you can call this function from an initializer. However, another trick is to add a defer closure to the initializer method.
}



let ahmed = Player(id: 12, name: "Ahmed    ")
print(ahmed.name)
print(ahmed.name.count)
