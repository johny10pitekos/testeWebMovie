//
//  APIService.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import Foundation

class ApiService {
    
    func fetchWebMovies(completion: @escaping(Result<WebMovies, CustomError>) -> Void) {
        
        let url = Constants.ProductionServer.baseURL
        
        APIManager.shared.apiManager(urlString: url, method: .get, expecting: WebMovies.self) { result in
            switch result {
            case .success(let listMovies):
                completion(.success(listMovies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

