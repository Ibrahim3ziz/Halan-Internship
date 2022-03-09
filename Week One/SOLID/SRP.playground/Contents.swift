
// https://www.marcosantadev.com/solid-principles-applied-swift/

import UIKit
// states that class should be changed for only one reason.

// This calss has three reasons to be changed (three responsiblities)
class Handler {
    
    func handle() {
        let data = requestDataToAPI()
        let array = parse(data: data)
        saveDatatoDB(array: array)
    }
    
    private func requestDataToAPI() -> Data {
        // API Request
        let data = Data()
        return data
    }
    
    private func parse(data: Data) -> [String] {
        // parse data and create the array of String
        let stringData = [String]()
        return stringData
    }
    
        
    private func saveDatatoDB(array: [String]) {
        // Save the array in DB (CoreData/Realm/...)
    }
}




// MARK: - SRP Application


class HandlerSRP {
    let APIHandler: APIHandler
    let parseHandler: ParseHandler
    let dbHandler: DBHandler
    
    init(APIHandler: APIHandler, parseHandler: ParseHandler, dbHandler: DBHandler) {
        self.APIHandler = APIHandler
        self.parseHandler = parseHandler
        self.dbHandler = dbHandler
    }
    
    func handle() {
        let data = APIHandler.requsetDataToAPI()
        let array = parseHandler.parse(data: data)
        dbHandler.saveDataToDB(array: array)
    }
    
}

class APIHandler {
    func requsetDataToAPI() -> Data {
        // Handling API Requst
        let data = Data()
        return data
    }
}

class ParseHandler {
    func parse(data: Data) -> [String] {
        // Handling parsing data
        let parsedData = [String]()
        return parsedData
    }
}

class DBHandler {
    func saveDataToDB(array: [String]) {
        // Handling Data saving to DB
    }
}

