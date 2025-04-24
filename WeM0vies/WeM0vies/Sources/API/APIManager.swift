//
//  APIManager.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import Foundation

enum CustomError: Error {
    case error(Error)
    case invalidUrl
    case invalidResponse
    case errorStatusCode(Int)
    case invalidData
    case invalidJsonDecoder
}

class APIManager {
    
    enum Method: String {
        case get = "GET"
    }
    
    static let shared = APIManager()
    
    private init() {}
    
    func apiManager<T: Codable>(urlString: String, method: Method, expecting: T.Type, completion: @escaping(Result<T, CustomError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.error(error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            if (200...299).contains(response.statusCode) {
                guard let data = data else {
                    completion(.failure(.invalidJsonDecoder))
                    return
                }
                self.decodeData(data, expecting: expecting, completion: completion)
            } else {
                completion(.failure(.errorStatusCode(response.statusCode)))
            }
        }
        task.resume()
    }
    
    private func decodeData<T: Codable>(_ data: Data, expecting: T.Type, completion: @escaping(Result<T, CustomError>) -> Void) {
        
        do {
            let jsonDecoder = try JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.sync {
                completion(.success(jsonDecoder))
            }
        } catch {
            completion(.failure(.error(error)))
        }
    }
}

