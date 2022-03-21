//: [Previous](@previous)

import Foundation

extension Swift.Result {
      // ... snip

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

enum NetworkError: Error {
    case fetchFailed(Error)
}

func callURL(with url: URL, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
        let dataTaskError = error.map { NetworkError.fetchFailed($0)}
        let result = Result<Data, NetworkError>(value: data, error: dataTaskError)
        completionHandler(result)
    })
    
    task.resume()
}


enum SearchResultError: Error {
    case invalidTerm(String)
    case underlyingError(NetworkError)
    case invalidData
}

typealias SearchResult<Value> = Result<Value, SearchResultError>
typealias JSON = [String: Any]


func search(term: String, completionHandler: @escaping (SearchResult<JSON>) -> Void) {
    let encodedString = term.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    let path = encodedString.map {
        "https://itunes.apple.com/search?term=" + $0
    }
    
    guard let url = path.flatMap(URL.init) else {
        completionHandler(SearchResult<JSON>.failure(SearchResultError.invalidTerm(term)))
        return
    }
    
    callURL(with: url) { result in
        let convertedResult =
            result
            .map { (data: Data) -> JSON in
                guard
                    let json = try? JSONSerialization.jsonObject(with: data, options: []),
                    let jsonDictionary = json as? JSON
                    else {
                    return [:]
                }
                return jsonDictionary
            }
            .mapError { (networkError: NetworkError) -> SearchResultError in
                return SearchResultError.underlyingError(networkError)
            }
        completionHandler(convertedResult)
    }
}

public func mapError<E: Error> (_ transform: (ErrorType) throws -> E) rethrows -> (Result<Value, E>) {
    
}

//: [Next](@next)
