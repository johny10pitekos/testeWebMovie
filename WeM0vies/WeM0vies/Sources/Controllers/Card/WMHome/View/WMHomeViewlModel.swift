//
//  WMHomeViewlModel.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import Foundation

class WMHomeViewModel {
    
    private let apiService = ApiService()
    private var movies: WebMovies?
    
    var numberOfRows: Int {
        return movies?.products?.count ?? 0
    }
    
    func cellForRowsMovie(indexPath: IndexPath) -> Product? {
        return movies?.products?[indexPath.row]
    }
    
    func fetchWebMoviesViewModel(completion: @escaping(Result<Bool, CustomError>) -> Void) {
        apiService.fetchWebMovies { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let movie):
                self.movies = movie
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
