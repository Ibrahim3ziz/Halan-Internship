import UIKit
import Foundation

enum NetworkError: Error {
    case fetchFailed(Error)
}


func callURL(url: URL, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
//        completionHandler(data, error)
    })
    task.resume()
}

let url = URL(string: "https://itunes.apple.com/search?term=iron%20man")!

callURL(url: url) { result in
    switch result {
    case .success(let data):
        let value = String(data: data, encoding: .utf8)
//        let value: Data? = try? result.dematerialize()
        print(value)
    case .failure(let error):
        print(error)
    }
}



//callURL(url: url) { (data, error) in
//    if let error = error {
//        print(error)
//    } else if let data = data {
//        let value = String(data: data, encoding: .utf8)
//        print(value)
//    } else {
//        // What goes here.
//    }
//}




/// There is error because it is non escaping; as it must not leave the scope.
/// If we remove @escaping --> There is an error.
func doSomething(using closure: @escaping () -> Void) {
    DispatchQueue.main.async {
        closure()
    }
}
