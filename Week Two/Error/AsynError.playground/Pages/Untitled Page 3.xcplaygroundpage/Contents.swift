//: [Previous](@previous)
import UIKit
import Foundation
import PlaygroundSupport



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

func callURL(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
    }
    task.resume()
}
