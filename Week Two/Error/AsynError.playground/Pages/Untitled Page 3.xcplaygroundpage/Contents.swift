//: [Previous](@previous)
import UIKit
import Foundation
import PlaygroundSupport

enum NetworkError: Error {
    case fetchFailed(Error)
}


extension Swift.Result {

    init(value: Success?, error: Failure?) {
        if let error = error {
            self = .failure(error)
        } else if let value = value {
            self = .success(value)
        } else {
            fatalError("Could not create Result")
        }
    }
    
}

func callURL(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
        let dataTaskError = error.map { NetworkError.fetchFailed($0)}
        let result = Result<Data, NetworkError>(value: data, error: dataTaskError)
    })
    task.resume()
}
