//
//  WebMovies.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import Foundation

// MARK: - WebMovies
struct WebMovies: Codable {
    let products: [Product]?
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let image: String?
}
