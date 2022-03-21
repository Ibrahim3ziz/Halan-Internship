//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
    case fetchFailed(Error)
}

enum SearchResultError: Error {
    case invalidTerm(String)
    case underlyingError(NetworkError)
    case invalidData
}

func callURL(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
        let dataTaskError = error.map { NetworkError.fetchFailed($0)}
        let result = (Result<Data, NetworkError>).self
        let successResult = Result<Data, NetworkError>.success(data!)
        let failureResult = Result<Data, NetworkError>.failure(dataTaskError!)
    })
    task.resume()
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
    
    
    callURL(url: url) { result in
        switch result {
        case .success(let data):
            if let json = try? JSONSerialization.jsonObject(with: data, options: []),
               let jsonDictionary = json as? JSON {
                let result =  SearchResult<JSON>.success(jsonDictionary)
                completionHandler(result)
            } else {
                let result = SearchResult<JSON>.failure(SearchResultError.invalidData)
            }
        case .failure(let error):
            let result = SearchResult<JSON>.failure(SearchResultError.underlyingError(error))
            completionHandler(result)
        }
    }
}


//: [Next](@next)


// 'Result<Dictionary<String, Any>, SearchResultError>')
