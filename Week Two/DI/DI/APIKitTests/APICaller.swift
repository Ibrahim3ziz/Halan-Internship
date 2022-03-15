//
//  APICaller.swift
//  APIKitTests
//
//  Created by Ibrahim Abdul Aziz on 13/03/2022.
//

import Foundation

public class APICaller {
    public static let shared = APICaller()
    private init() {}
    
    
    public func fetchCourseNames() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
        }
        
        task.resume()
        
    }
    
    
}
