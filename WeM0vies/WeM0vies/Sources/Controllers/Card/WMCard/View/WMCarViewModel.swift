//
//  WMCarViewModel.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import Foundation

class WMCarViewModel {
    
    private var movies: Product?
    
    var titleFilm: String {
        return movies?.title ?? ""
    }
    
    var imageURL: URL? {
        return URL(string: movies?.image ?? "")
    }
    
    var priceMovie: Double {
        return movies?.price ?? 0.0
    }
    
    func getProduts(movies: Product?) {
        self.movies = movies
    }
}

