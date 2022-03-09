import UIKit

// MARK: - Single Responsiblity Priniciple



//class LoginUser {
//
//    func login() {
//        let data = authenticareUserViaAPI()
//        let user = decodeUser(data: data)
//        saveToDB(array: array)
//    }
//
//    private func authenticareUserViaAPI() -> Date {
//
//    }
//
//    private func decodeUser(data: Date) -> User {
//
//    }
//
//    private func saveUserInfoOnDB(user: User) {
//
//    }
//}


class LoginUser {
    let oAuthHandler: OAuthenticationHandler
    let decodeHandler: DecodeHandler
    let dataBaseHandler: DataBaseHandler
    
    init(oAuthHandler: OAuthenticationHandler, decodeHandler: DecodeHandler, dataBaseHandler: DataBaseHandler) {
        self.oAuthHandler = oAuthHandler
        self.decodeHandler = decodeHandler
        self.dataBaseHandler = dataBaseHandler
    }
    
    
    func login() {
        let data = oAuthHandler.authenticareUserViaAPI()
        let user = DecodeHandler().decodeUser(data: data)
        dataBaseHandler.saveUserInfoOnDB(user: user)
    }
    
}

class OAuthenticationHandler {
    func authenticareUserViaAPI() -> Data {
        let data = Data()
        return data
    }
}



class DecodeHandler {
    func decodeUser(data: Data) -> User {
        // Decoding data into User
        let user = User(id: 2)
        return user
    }
}


class DataBaseHandler {
    func saveUserInfoOnDB(user: User) {
        // Saving user into DB
    }
}


struct User {
    let id: Int
}



// MARK: - Open-Closed Principle

// We must be able to extend the class without changing its behavior, This achieved by abstraction.

//class Scrapper {
//
//    func scrapVehicles() {
//
//        let cars = [Car(brand: "Ferrari"), Car(brand: "Kia"), Car(brand: "Mercides")]
//        cars.forEach { car in
//            print(car.getScrappingAddress())
//        }
//
//        let trucks = [Truck(brand: "Mercides"), Truck(brand: "Suzuki")]
//        trucks.forEach { truck in
//            print(truck.getScrappingAddress())
//        }
//
//    }
//}


// Using Protcol as a type
class Scrapper {
    
    func getScrappingAddress() {
        
        let vehicles: [Scrappable] = [
            Car(brand: "Ford"),
            Car(brand: "Peugeot"),
            Car(brand: "Toyota"),
            Truck(brand: "Volvo"),
            Truck(brand: "Nissan")
        ]
        vehicles.forEach { vehicle in
            print(vehicle.getScrappingAddress())
        }
    }
    
}



class Car: Scrappable {
    
    func getScrappingAddress() -> String {
        return "Cars scrapping address"
    }
    
    let brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
}


class Truck: Scrappable {
    func getScrappingAddress() -> String {
        return "Trucks scrapping address"
    }
    
    
    let brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
}


protocol Scrappable {
    func getScrappingAddress() -> String
}



