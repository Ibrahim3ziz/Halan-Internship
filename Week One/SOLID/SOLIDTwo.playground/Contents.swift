import UIKit

//MARK: - Liskove priniciple
// states that any class should be replaced by one of its subclasses without affecting its functioning

class Handler {
    
    func contact(user: UserModel) {
        // Retrive user from database
    }
    
}


class ValidUserService: Handler {
    
    override func contact(user: UserModel) {
        guard user.age > 17 else { return }
        super.contact(user: user)
    }
    
}


// Application of Liskove
class UserService {
    func contact(user: UserModel, minAge: Int = 0) {
        guard user.age > minAge else {
            return
        }
    }
}


struct UserModel {
    let age: Int
}



// MARK: - Interface segregation priniciple
// indicates that a client would not have to implement methods that he does not use.

protocol WalkProtocol {
    func walk()
}
 
protocol SwimmProtocol {
    func swimm()
}
 
protocol FlyProtocol {
    func fly()
}
 
struct Wale: SwimmProtocol {
    func swimm() {}
}
 
struct Crocodile: WalkProtocol, SwimmProtocol {
    func walk() {}
    func swimm() {}
}


// MARK: - Dependency inversion principle
/// High level classes should not depend on low level classes.
/// Both should depend on abstractions. Abstractions should not depend on the details. The details should depend on the abstractions.



class User {
    var name: String

    init(name: String) {
        self.name = name
    }
}

// Here us strong coupling

class CoreData {
    func save(user: User) {
        // Save user on database
    }
}


class UserServiceTwo {
    func save(user: User) {
        let database = CoreData()
        database.save(user: user)
    }
}

// What if u wanted to use Realm instead of CoreData


