// https://www.raulferrergarcia.com/inyeccion-de-dependencias-en-swift/
import UIKit
import XCTest


enum NetworkError: Error {
    case inavalidData
}



protocol NetworkManagerProtocol {
    func login(username: String, password: String, completion: @escaping (Data, Error) -> Void)
}


class LoginViewModel {
    
    var networkManager: NetworkManager?
    
   
    
    // Injection into initializer
 
    
    private func loginWith(username: String, password: String) {
        networkManager?.login(username: username, password: password, completion: { data,error  in
            guard error != nil else {
                NetworkError.inavalidData
                // Handling Error
                return
            }
            
            // Authorize Login
        })
    }
    
    
}

extension LoginViewModel {

    convenience init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

let loginViewModel = LoginViewModel()
loginViewModel.networkManager = NetworkManager()




class NetworkManager: NetworkManagerProtocol {
    func login(username: String, password: String, completion: @escaping (Data, Error) -> Void) {
        
    }
    
    
}

class NetworkManagerMock: NetworkManagerProtocol {
    func login(username: String, password: String, completion: @escaping (Data, Error) -> Void) {
//        completion(nil, error)
    }
    
    
}


class LoginViewModelTest: XCTestCase {
    func testViewModelWithData() {
        let networkManager = NetworkManagerMock()
        let loginViewModel = LoginViewModel(networkManager: networkManager)
        let exptectation = self.expectation(description: "Networking")
        var loginData: Data
        networkManager.login(username: "Marc", password: "1234") { data, error in
            loginData = data
            exptectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(loginData)
    }
}




